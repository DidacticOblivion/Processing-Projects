

void setup() {
  size(800, 600);
}


void draw() {
  loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int index = x + y * width;
      if (y >= loY(x, y) + height / 2 && y <= hiY(x, y) + height / 2 && x >= loX(x, y) + width / 2 && x <= hiX(x, y) + width / 2) {
        pixels[index] = color(0);
      } else {
        pixels[index] = color(255);
      }
    }
  }
  updatePixels();
  noLoop();
}

float loY(int a, int b) {
  float x = 1.0 * a - width / 2;
  float y = 1.0 * b - height / 2;
  return -0.001*pow(x,2) - 10;
}

float hiY(int a, int b) {
  float x = 1.0 * a - width / 2;
  float y = 1.0 * b - height / 2;
  return 0.001*pow(x,2) + 10;
}

float loX(int a, int b) {
  float x = 1.0 * a - width / 2;
  float y = 1.0 * b - height / 2;
  return -y*y - 100;
}

float hiX(int a, int b) {
  float x = 1.0 * a - width / 2;
  float y = 1.0 * b - height / 2;
  return y*y + 100;
}
