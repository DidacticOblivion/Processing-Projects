class FluidPoint {
  PVector pos;
  PVector prevPos;
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  
  float shade = random(100, 200);
  
  float maxSpeed;
  
  FluidPoint(float x, float y, float ms) {
    pos = new PVector(x, y);
    prevPos = pos.copy();
    maxSpeed = ms;
  }
  
  void update() {
    prevPos = pos.copy();
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
    vel.limit(maxSpeed);
    
    if (pos.x > width || pos.x < 0) {
      pos.x = (pos.x > width ? 0 : width);
      prevPos = pos.copy();
    }
    if (pos.y > height || pos.y < 0) {
      pos.y = (pos.y > height ? 0 : height);
      prevPos = pos.copy();
    }
    
    noFill();
    stroke(shade);
    strokeWeight(5);
    line(prevPos.x, prevPos.y, pos.x, pos.y);
  }
  
  void applyForce(float x, float y) {
    acc.add(new PVector(x, y));
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
}