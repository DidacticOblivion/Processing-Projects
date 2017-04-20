class RigidBody {
  PVector pos = new PVector();
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  
  float radius;
  
  
  
  RigidBody(PVector _pos, float _radius) {
    pos = _pos;
    radius = _radius;
  }
  
  RigidBody(float x, float y, float _radius) {
    pos = new PVector(x, y);
    radius = _radius;
  }
  
  
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void nullForce() {
    acc.mult(0);
  }
  
  
  
  void edgeCheck() {
    if (pos.x > width - radius || pos.x < radius) {
      vel.x *= -1;
    }
    if (pos.y > height - radius || pos.y < radius) {
      vel.y += -1;
    }
  }
  
  void update() {
    edgeCheck();
    
    pos.add(vel);
    vel.add(acc);
    
    if (abs(acc.mag()) < 0.5) {
      acc.mult(0);
    }
    
    acc.div(2);
  }
}