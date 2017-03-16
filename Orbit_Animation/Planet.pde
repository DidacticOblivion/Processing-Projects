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
    pos.x = r * cos(oPos * (oSpeed / 100));
    pos.y = r * sin(oPos * (oSpeed / 100));
    oPos++;
  }
  
  void show() {
    stroke(35,170,100);
    strokeWeight(5);
    fill(40,170,100);
    ellipse(pos.x,pos.y,40,40);
  }
  
}