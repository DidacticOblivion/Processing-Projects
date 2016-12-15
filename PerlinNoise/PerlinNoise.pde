int x;
int y;
float z1;
float z2;
float z3;

void setup() {
  size(800,800);
}

void draw() {
  for (y = 0; y < height; y++) {
    for (x = 0; x < width; x++) {
      z1 = random(255);
      z2 = random(255);
      z3 = random(255);
      set(x,y,color(z1,z2,z3));
    }
  }
}