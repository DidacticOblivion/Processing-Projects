class FObject {
  PVector pos;
  private PVector vel = new PVector(0, 0);
  private PVector acc = new PVector(0, 0);
  float resistance = 0.1;
  
  FObject() {
    pos = new PVector(random(width), random(height));
  }
  
  FObject(int x, int y) {
    pos = new PVector(x, y);
  }
  
  void applyForce(float mag, float dir) {
    acc.add(new PVector( mag * cos(dir), mag * sin(dir) ));
  }
  
  void update() {
    float drag = resistance * pow(vel.mag(), 2);
    pos.add(vel);
    vel.setMag(vel.mag() - drag);
    vel.add(acc);
    acc.mult(0);
    
    if (pos.x > width || pos.x < 0) {
      pos.x = (pos.x < 0 ? width : 0);
    }
    if (pos.y > height || pos.y < 0) {
      pos.y = (pos.y < 0 ? height : 0);
    }
  }
}
