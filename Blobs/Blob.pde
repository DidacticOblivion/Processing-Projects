class Blob {
  PVector pos;
  PVector vel = new PVector(random(-5,5),random(-5,5));
  float r;
  
  Blob(float x, float y, float _r) {
    pos.x = x;
    pos.y = y;
    r = _r;
  }
  
  void update() {
    if (pos.x >= width - r || pos.x <= r) {
      vel.x *= -1;
    }
    if (pos.y >= height - r || pos.y <= r) {
      vel.y *= -1;
    }
    
    pos.add(vel);
  }
  
}