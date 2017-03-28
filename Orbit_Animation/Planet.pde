class Planet {
  
  Moon[] moons = new Moon[floor(random(2) + 0.5)];
  PVector pos = new PVector(0, 0);
  float oSpeed;
  
  float r;
  float oPos = random(TWO_PI);
  
  Planet(float _r, float _oSpeed) {
    r = _r;
    oSpeed = _oSpeed;
  }
  
  void spawnMoons() {
    if (moons.length != 0) {
      for (int i = 0; i < moons.length; i++) {
        moons[i] = new Moon(random(35,60), random(oSpeed, oSpeed * 5));
      }
    }
  }
  
  void update() {
    pos.x = r * sin(oPos * oSpeed);
    pos.y = r * cos(oPos * oSpeed);
    oPos += 0.1;
    
    if (moons.length != 0) {
      //update moons
      for (Moon mun : moons) {
        pushMatrix();
        mun.update();
        translate(pos.x, pos.y);
        mun.show();
        popMatrix();
      }
    }
  }
  
  void show() {
    stroke(35,170,100);
    strokeWeight(5);
    fill(40,170,100);
    ellipse(pos.x,pos.y,40,40);
  }
  
}