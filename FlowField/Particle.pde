class Particle {
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void applyForce(float f1, float f2) {
    acc.add(f1, f2);
  }
  
  void show() {
    stroke(0);
    point(pos.x, pos.y);
  }
}