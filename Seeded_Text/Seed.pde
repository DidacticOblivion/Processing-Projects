class Seed {
  PVector pos = new PVector(0, 0);
  float r = 1;
  boolean grow = true;
  color clr = color(random(340),255,255);
  
  Seed(float _x, float _y) {
    pos.x = floor(_x + 0.5);
    pos.y = floor(_y + 0.5);
  }
  
  Seed(Seed in) {
    pos = in.pos;
    r = in.r;
    grow = in.grow;
  }
  
  void show() {
    noFill();
    stroke(clr);
    strokeWeight(3);
    ellipse(pos.x, pos.y, 2 * r, 2 * r);
  }
  
  void edges() {
    if (pos.y + r + 1 >= height || pos.y - r - 1 <= 0) {
      grow = false;
    }
    if (pos.x + r + 1 >= width || pos.x - r - 1 <= 0) {
      grow = false;
    }
  }
  
  void update(ArrayList<Seed> seeds) {
    for (Seed s : seeds) {
      if (s != this) {
        if (dist(s.pos.x, s.pos.y, pos.x, pos.y) <= s.r + r + 3) {
          grow = false;
        }
      }
    }
    if (grow) {
      r += 1;
    }
    edges();
  }
}