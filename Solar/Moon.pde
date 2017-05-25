class Moon extends OrbitalBody {
  
  Planet parentPlanet;
  
  color mColor;
  float d;
  
  Moon(Planet parent) {
    parentPlanet = parent;
    generate();
  }
  
  void generate() {
    colorMode(HSB, 360, 100, 100);
    mColor = color(26, random(26), random(32, 58));
    d = random(3, 9);
    radius = random(parentPlanet.d + 10, parentPlanet.d + 20);
    step = random(TWO_PI);
  }

  void show(float x, float y) {
    noStroke();
    fill(mColor);
    ellipse(x, y, d, d);
    
    step += vel();
  }
}