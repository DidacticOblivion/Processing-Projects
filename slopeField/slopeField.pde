int scl = 20;

void setup() {
  size(800, 600);
  background(0);
}


void draw() {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (y % scl == 0 && x % scl == 0) {
        
      }
    }
  }
}

float x(float in) {
  return in * in * 0.05;
}

float y(float in) {
  return in * 5 / (in * in);
}
