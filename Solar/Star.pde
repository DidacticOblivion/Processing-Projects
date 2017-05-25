enum StarClasses {
  O, B, A, F, G, K, M
} 

class Star {
  float x;
  float y;
  float radius;
  float bounds;
  float red;
  float grn;
  float blu;

  float bloom = 150;

  private float r;
  private float g;
  private float b;

  PGraphics star;

  ArrayList<Planet> planets = new ArrayList<Planet>();

  Star() {
    generate(0);
  }

  Star(int n) {
    generate(n);
  }

  StarClasses starClass;

  void generate(int n) {
    //Random Stuff
    int select = floor(random(1, 17)+0.5);
    if (select == 1) {
      starClass = StarClasses.O;
    } else if (select == 2) {
      starClass = StarClasses.B;
    } else if (select >= 3 && select <= 4) {
      starClass = StarClasses.A;
    } else if (select >= 5 && select <= 6) {
      starClass = StarClasses.F;
    } else if (select >= 7 && select <= 9) {
      starClass = StarClasses.G;
    } else if (select >= 10 && select <= 13) {
      starClass = StarClasses.K;
    } else {
      starClass = StarClasses.M;
    }
    //Choose star class based on random stuff
    switch (starClass) {
    case O:
      red = 76;
      grn = 118;
      blu = 255;
      radius = floor(random(10, 30));
      break;
    case B:
      red = 132;
      grn = 161;
      blu = 255;
      radius = floor(random(20, 50));
      break;
    case A:
      red = 211;
      grn = 221;
      blu = 255;
      radius = floor(random(50, 75));
      break;
    case F:
      red = 255;
      grn = 255;
      blu = 255;
      radius = floor(random(60, 80));
      break;
    case G:
      red = 255;
      grn = 240;
      blu = 130;
      radius = floor(random(60, 100));
      break;
    case K:
      red = 252;
      grn = 177;
      blu = 123;
      radius = floor(random(100, 175));
      break;
    case M:
      red = 255;
      grn = 144;
      blu = 117;
      radius = floor(random(100, 250));
      break;
    }
    bounds = radius * 0.75;
    r = map(red, 0, 180, 0, 255);
    g = map(grn, 0, 180, 0, 255);
    b = map(blu, 0, 180, 0, 255);
    println("Star class: " + starClass);

    //Generate image
    star = createGraphics(width, height);
    star.beginDraw();
    star.translate(widthH, heightH);
    star.noFill();

    star.strokeWeight(3);
    for (int i = 0; i < bloom; i++) {
      star.stroke(red, grn, blu, 100 * (i / bloom));
      star.ellipse(0, 0, radius + bloom - i, radius + bloom - i);
    }

    star.strokeWeight(6);
    star.stroke(r, g, b);
    star.fill(red + 100, grn + 100, blu + 100);
    star.ellipse(0, 0, radius, radius);
    star.endDraw();

    for (int i = 0; i < n; i++) {
      addPlanet();
    }
  }

  void regen() {
    generate(0);
  }

  void show() {
    image(star, -widthH, -heightH);

    for (Planet p : planets) {
      p.show();
    }
  }

  void addPlanet() {
    planets.add(new Planet(random(TWO_PI), this, planets));
  }

  void removePlanet() {
    if (planets.size() > 0) {
      planets.remove(planets.size() - 1);
    }
  }

  void regenPlanets() {
    for (Planet p : planets) {
      p.generate(planets, false);
      p.regenMoons();
    }
  }
}