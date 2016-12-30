class RigidBody {
  
  PVector location;
  PVector velocity;
  float drag;
  float mass;
  
  RigidBody(PVector _location, PVector _velocity, float _mass, float _drag) {
    location = _location;
    drag = _drag;
    velocity = _velocity;
    mass = _mass;
  }
  
  RigidBody(PVector _location, float _mass, float _drag) {
    location = _location;
    drag = _drag;
    velocity = new PVector(0,0);
    mass = _mass;
  }
  
  RigidBody(float _mass, float _drag) {
    location = new PVector(0,0);
    drag = _drag;
    velocity = new PVector(0,0);
    mass = _mass;
  }
  
  //V = (F/m)t
  void addForce (PVector force) {
    velocity = velocity.add(new PVector((force.x / mass)/20, (force.y / mass)/20));
  }
  
  void update() {
    //drag
    if (velocity.x < 0) {
      velocity.x += drag/100;
    } else if (velocity.x > 0) {
      velocity.x -= drag/100;
    }
    if (velocity.y < 0) {
      velocity.y += drag/100;
    } else if (velocity.y > 0) {
      velocity.y -= drag/100;
    }
    
    //movement
    location = location.add(velocity);
  }
}