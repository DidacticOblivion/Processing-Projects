class Seed {
  PVector pos = new PVector(0, 0);
  float r = 1;
  boolean grow = true;
  
  public Seed(int _x, int _y) {
    pos.x = _x;
    pos.y = _y;
  }
  
  void grow() {
    if (grow) {
      r += 0.5;
    }
  }
  
  void show() {
    noFill();
    stroke(255);
    strokeWeight(3);
    ellipse(pos.x, pos.y, 2 * r, 2 * r);
  }
}