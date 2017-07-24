PImage img;
int scl = 10;

void setup() {
  size(600, 600);
  img = loadImage("Supporting/eye.jpg");
  background(255);
  //image(img, 0, 0);
  
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (y % scl == 0 && x % scl == 0) {
        blurEllipse(x, y);
      }
    }
  }
}

void blurEllipse(float x_, float y_) {
  int brightSum = 0;
  img.loadPixels();
  for (int i = (int)x_; i < x_ + scl; i++) {
    for (int j = (int)y_; j < y_ + scl; j++) {
      int index = j * width + i;
      brightSum += brightness(img.pixels[index]);
    }
  }
  brightSum /= scl * scl;
  noStroke();
  fill(brightSum);
  ellipse(x_ + scl / 2, y_ + scl / 2, scl, scl);
}