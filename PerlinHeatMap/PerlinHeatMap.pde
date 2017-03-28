float nScl = 1;
float speed = 1;

float fly = random(10);
float zoff = random(1000);

void setup() {
  colorMode(HSB);
  size(1000,800);
}

void draw() {
  loadPixels();
  float yoff = 0;
  for (int y = 0; y < height; y++) {
    float xoff = fly;
    for (int x = 0; x < width; x++) {
      float n = noise(xoff, yoff, zoff);
      int index = x + y * width;
      pixels[index] = color(n * 360, 255, 255);
      xoff += nScl / 300;
    }
    yoff += nScl / 300;
  }
  fly += speed / 100;
  zoff += speed / 100;
  updatePixels();
}