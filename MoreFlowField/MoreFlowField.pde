int scl = 20;

void setup() {
  size(800, 800);
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (y % scl == 0 && x % scl == 0) {
        rect(x, y, scl - 1, scl - 1);
      }
    }
  }
}

void draw() {
  background(255);
}