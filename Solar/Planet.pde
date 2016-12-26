class Planet {
  float d;
  boolean canHaveMoon = false;
  
  float r = 255;
  float g = 255;
  float b = 255;
  
  PlanetClasses pClass;
  PlanetTypes pType;
  
  void generate() {
    int select = floor(random(1,4) + 0.5);
    if (select == 1 || select == 4) {
      pClass = PlanetClasses.Minor;
    } else if (select == 2) {
      pClass = PlanetClasses.Rocky;
    } else if (select == 3) {
      pClass = PlanetClasses.Gas;
    }
    switch (pClass) {
      case Minor:
        select = floor(random(1,2)+ 0.5);
        if (select == 1) {
          pType = PlanetTypes.Planetoid;
          r = random(135,180);
          g = 138;
          b = 104;
          d = random(10,15);
        } else {
          pType = PlanetTypes.Mercurian;
          select = floor(random(1,7) + 0.5);
          r = random(145,190);
          g = 138;
          b = 104 - (104 * r/45);
          d = random(15,20);
          if (select == 5) {
            canHaveMoon = true;
          }
        }
        break;
      case Rocky:
        select = floor(random(1,3)+ 0.5);
        if (select == 1) {
          pType = PlanetTypes.Subterran;
          d = random(20,25);
          select = floor(random(1,4) + 0.5);
          if (select == 4) {
            canHaveMoon = true;
          }
        } else if (select == 2) {
          pType = PlanetTypes.Terran;
          d = random(25,35);
          select = floor(random(1,3) + 0.5);
          if (select == 3) {
            canHaveMoon = true;
          }
        } else {
          pType = PlanetTypes.Superterran;
          d = random(35,50);
          select = floor(random(1,3) + 0.5);
          if (select == 3) {
            canHaveMoon = true;
          }
        }
        break;
      case Gas:
        select = floor(random(1,2)+ 0.5);
        if (select == 1) {
          pType = PlanetTypes.Neptunian;
          d = random(80,95);
          select = floor(random(1,3) + 0.5);
          if (select >= 2) {
            canHaveMoon = true;
          }
        } else {
          pType = PlanetTypes.Jovian;
          d = random(95,110);
          select = floor(random(1,5) + 0.5);
          if (select >= 3) {
            canHaveMoon = true;
          }
        }
        break;
    }
    println("Planet type: " + pType);
    println("Moon poosible: " + canHaveMoon);
  }
  
  void show(float x, float y) {
    fill(r,g,b);
    stroke(r,g,b);
    ellipse(x,y,d,d);
  }
}