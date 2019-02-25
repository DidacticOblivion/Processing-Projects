class Vehicle {
  PVector acc = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector pos = new PVector();
  float mass = 1;
  
  PVector fGrav = new PVector(0, mass / 10);
  
  void update() {
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
    vel.mult(0.99);
    
    acc.add(fGrav);
    
    if (pos.y > height) {
      pos.y = height;
      vel.mult(0);
    }
  }
  
  void applyForce(float f) {
    PVector force = new PVector(0, -f * 2 / mass);
    acc.add(force);
  }
}
