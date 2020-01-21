VNoise vn;

float scl = 10;

void setup() {
  size(1200, 800);
  background(0);
  vn = new VNoise();
}


void draw() {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (y % scl == 0 && x % scl == 0) {
        noStroke();
        fill(vn.n(x, y) * 255);
        rect(x, y, scl, scl);
      }
    }
  }
  noLoop();
}
