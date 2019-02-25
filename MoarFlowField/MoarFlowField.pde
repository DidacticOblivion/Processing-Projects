int scl = 50;
long mass = 10000;

FObject p;

ArrayList<PVector> vectors = new ArrayList<PVector>();

void setup() {
  size(1000, 700);
  background(20);
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (y % scl == 0 && x % scl == 0) {
        vectors.add(new PVector(0, scl / 2));
      }
    }
  }
  
  p = new FObject(width / 2, height / 2);
}

void updateField(float tX, float tY) {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (y % scl == 0 && x % scl == 0) {
        int index = (x + y * width / scl) / scl;
        vectors.get(index).x = (mouseX - x > 0 ? atan((y- tY) / (x - tX)) : PI + atan((y- tY) / (x - tX)));
        vectors.get(index).y = mass / dist(tX, tY, x, y);
      }
    }
  }
}

void draw() {
  background(20);
  noFill();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (y % scl == 0 && x % scl == 0) {
        stroke(100);
        rect(x, y, scl - 1, scl - 1);
        int index = (x / scl) + (y * width / scl / scl);
        stroke(255);
        line(
          x,
          y,
          x + vectors.get(index).y * cos(vectors.get(index).x),
          y + vectors.get(index).y * sin(vectors.get(index).x)
        );
        if (p.pos.x >= x && p.pos.x <= x + scl && p.pos.y >= y && p.pos.y <= y + scl) {
          p.applyForce(vectors.get(index).x, vectors.get(index).y);
        }
      }
    }
  }
  updateField(mouseX, mouseY);
  p.update();// apply force from closest grid square
  fill(255);
  ellipse(p.pos.x, p.pos.y, 25, 25);
}
