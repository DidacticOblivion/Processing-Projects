float scl = 10;
float nScl = 2;
float speed = 5;

float fly = random(10);
float clr1 = random(360);
float clr2 = clr1 + 45;
float brt1 = random(255);
float brt2 = random(255);

float zoff = random(1000);

void setup() {
  colorMode(HSB);
  size(1000,800);
  if (clr2 > 360) {
    clr2 = clr2 - 360;
  }
}

void draw() {
  background(clr1, 255, brt1);
  float yoff = 0;
  for (int y = 0; y < height; y++) {
    float xoff = fly;
    for (int x = 0; x < width; x++) {
      float n = noise(xoff, yoff, zoff);
      if (x % scl == 0 && y % scl == 0) {
        noStroke();
        fill(clr2, 255, brt2, 255 * n);
        rect(x, y, scl, scl);
      }
      xoff += nScl / 300;
    }
    yoff += nScl / 300;
  }
  fly += speed / 100;
  zoff += speed / 100;
}