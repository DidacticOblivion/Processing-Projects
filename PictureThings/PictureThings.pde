PImage img;
int scl = 20;

void setup() {
  size(1200, 800);
  img = loadImage("Supporting/owl.jpg");
  img.resize(1200,800);
  background(42);
  image(img, 0, 0);
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      blurEllipse(x, y);
    }
  }
}

void blurEllipse(float x_, float y_) {
  int hueSum = 0;
  int satSum = 0;
  int brightSum = 0;
  img.loadPixels();
  for (int i = (int)x_; i < x_ + scl; i++) {
    for (int j = (int)y_; j < y_ + scl; j++) {
      int index = j * img.width + i;
      hueSum += hue(img.pixels[index]);
      satSum += saturation(img.pixels[index]);
      brightSum += brightness(img.pixels[index]);
    }
  }
  hueSum /= scl * scl;
  satSum /= scl * scl;
  brightSum /= scl * scl;
  colorMode(HSB);
  noStroke();
  fill(hueSum, satSum, brightSum);
  ellipse(x_ + scl / 2, y_ + scl / 2, scl, scl);
}