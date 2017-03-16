class Planet {
  
  PVector pos = new PVector(0, 0);
  float oSpeed;
  
  float r;
  float oPos = random(360);
  
  Planet(float _r, float _oSpeed) {
    r = _r;
    oSpeed = _oSpeed;
  }
  
  void update() {
    pos.x = r * sin(oPos * oSpeed);
    pos.y = r * cos(oPos * oSpeed);
    oPos += 0.1;
  }
  
  void show() {
    stroke(35,170,100);
    strokeWeight(5);
    fill(40,170,100);
    ellipse(pos.x,pos.y,40,40);
  }
  
}