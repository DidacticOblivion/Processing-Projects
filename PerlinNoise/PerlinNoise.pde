int x;
int y;
float z;

void setup() {
  size(200,200);
}

void draw() {
  for (y = 0; y < height; y++) {
    for (x = 0; x < width; x++) {
      z = random(255);
      set(x,y,color(z));
    }
  }
}