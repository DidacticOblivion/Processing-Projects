enum PlanetClasses {
  Minor, Rocky, Gas
}
enum PlanetTypes {
  Planetoid, Mercurian, Subterran, Terran, Superterran, Neptunian, Jovian
}

class Planet extends OrbitalBody {

  Star parentStar;
  ArrayList<Moon> moons = new ArrayList<Moon>();

  float d;
  color pColor;
  boolean canHaveMoon;
  float gravity;

  Planet(float _step, Star parent, ArrayList<Planet> others) {
    step = _step;
    parentStar = parent;
    generate(others, true);
  }



  PlanetClasses pClass;
  PlanetTypes pType;

  void generate(ArrayList<Planet> others, boolean initMoons) {
    radius = parentStar.radius;
    colorMode(HSB, 360, 100, 200);
    
    int select = floor(random(1, 5) + 0.5);
    if (select == 1) {
      pClass = PlanetClasses.Minor;
      radius += random(100);
      gravity = 20;
    } else if (select == 2) {
      pClass = PlanetClasses.Rocky;
      radius += random(100, 200);
      gravity = 50;
    } else if (select == 3) {
      pClass = PlanetClasses.Gas;
      radius += random(300, 500);
      gravity = 100;
    } else if (select == 4) {
      pClass = PlanetClasses.Minor;
      radius += random(600, 700);
      gravity = 20;
    } else if (select == 5) {
      pClass = PlanetClasses.Rocky;
      radius += random(600, 700);
      gravity = 50;
    }

    switch (pClass) {
    case Minor:
      select = floor(random(1, 2)+ 0.5);
      if (select == 1) {
        pType = PlanetTypes.Planetoid;
        pColor = color(32, random(50), 100);
        d = random(6, 10);
      } else {
        pType = PlanetTypes.Mercurian;
        select = floor(random(1, 7) + 0.5);
        pColor = color(random(20, 43), random(40), 100);
        d = random(10, 20);
        if (select == 5) {
          canHaveMoon = true;
        }
      }
      break;
    case Rocky:
      select = floor(random(1, 3)+ 0.5);
      if (select == 1) {
        pType = PlanetTypes.Subterran;
        d = random(20, 25);
        select = floor(random(1, 4) + 0.5);
        if (select == 4) {
          canHaveMoon = true;
        }
      } else if (select == 2) {
        pType = PlanetTypes.Terran;
        d = random(25, 35);
        select = floor(random(1, 3) + 0.5);
        if (select == 3) {
          canHaveMoon = true;
        }
      } else {
        pType = PlanetTypes.Superterran;
        d = random(35, 50);
        select = floor(random(1, 3) + 0.5);
        if (select == 3) {
          canHaveMoon = true;
        }
      }
      pColor = color(random(30, 43), random(10, 40), 100);
      break;
    case Gas:
      select = floor(random(1, 2)+ 0.5);
      if (select == 1) {
        pType = PlanetTypes.Neptunian;
        d = random(50, 70);
        select = floor(random(1, 3) + 0.5);
        if (select >= 2) {
          canHaveMoon = true;
        }
      } else {
        pType = PlanetTypes.Jovian;
        d = random(70, 80);
        select = floor(random(1, 5) + 0.5);
        if (select >= 3) {
          canHaveMoon = true;
        }
      }
      float asdf = floor(random(1, 3) + 0.5);
      if (asdf == 1) {
        pColor = color(random(34), random(70, 100), 100);
      } else if (asdf == 2) {
        pColor = color(172, random(30, 70), 100);
      } else {
        pColor = color(random(190, 246), random(50, 80), 100);
      }
      break;
    }

    for (Planet p : others) {
      //Planet p = others.get(i);
      if (p != this) {
        if (p.radius != radius && p.radius - p.d - p.gravity > (radius + d) + gravity && p.radius + p.d + p.gravity < (radius - d) - gravity) {
          println("Regenerating Planet");
          generate(others, true);
          break;
        }
      }
    }

    if (canHaveMoon && initMoons) {
      float rand = random(5);
      for (int i = 0; i < rand; i++) {
        addMoon();
      }
    }

    println("Planet type: " + pType);
    println("Moon poosible: " + canHaveMoon);
  }

  void show() {
    colorMode(HSB, 360, 100, 100);
    fill(pColor);
    stroke(pColor);

    ellipse(parentStar.x + pos().x, parentStar.y + pos().y, d, d);

    step += vel();

    for (Moon m : moons) {
      m.show(pos().x + m.pos().x, pos().y + m.pos().y);
    }
  }

  void addMoon() {
    moons.add(new Moon(this));
  }

  void removeMoon() {
    if (moons.size() > 0) {
      moons.remove(moons.size() - 1);
    }
  }

  void regenMoons() {
    for (Moon m : moons) {
      m.generate();
    }
  }
}