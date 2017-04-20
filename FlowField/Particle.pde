class Particle {
  PVector pos = new PVector(random(1, width - 1), random(1, height - 1));
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  
  float darkness = 5;
  float maxSpeed = 5;
  
  PVector prevPos = pos.copy();
  
  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void applyForce(float f1, float f2) {
    acc.add(f1, f2);
  }
  
  void show(color col) {
    stroke(col, darkness);
    strokeWeight(1);
    line(pos.x,pos.y,prevPos.x,prevPos.y);
    //point(pos.x, pos.y);
    updatePrev();
  }
  
  void follow(PVector[] vect) {
    int x = floor(pos.x);
    int y = floor(pos.y);
    int index = x / scl + y / scl * cols;
    PVector force = vect[constrain(index, 0, cols * rows - 1)];
    applyForce(force);
  }
  
  void updatePrev() {
    prevPos.x = pos.x;
    prevPos.y = pos.y;
  }
  
  void edges() {
    if (pos.x > width) {
      pos.x = 0;
      updatePrev();
    } 
    else if (pos.x < 0) {
      pos.x = width - 1;
      updatePrev();
    }
    if (pos.y > height) {
      pos.y = 0;
      updatePrev();
    } 
    else if (pos.y < 0) {
      pos.y = height - 1;
      updatePrev();
    }
  }
}