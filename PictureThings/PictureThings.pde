PImage img;
int scl = 20;

PVector minCorners;
PVector maxCorners;

void setup() {
  size(1200, 800);
  img = loadImage("Supporting/wide.jpg");
  img = imageToBackground(img);
  
  minCorners = new PVector(width / 2 - img.width / 2, height / 2 - img.height / 2);
  maxCorners = new PVector(width / 2 + img.width / 2, height / 2 + img.height / 2);
  
  background(0);
  image(img, minCorners.x, minCorners.y);
  
  for (int y = (int)minCorners.y; y < maxCorners.y; y++) {
    for (int x = (int)minCorners.x - 1; x < maxCorners.x; x++) {
      if (y % scl == 0 && x % scl == 0) {
        blurEllipse(x, y);
      }
    }
  }
}


PImage imageToBackground(PImage i) {
  float imgRatio = i.width / i.height;
  float bgRatio = width / height;
  
  if (imgRatio >= bgRatio) {
    i.resize(1200, floor(imgRatio / i.height));
  } else {
    i.resize(floor(imgRatio * i.width), 800);
  }
  
  return i;
}


void blurEllipse(float x_, float y_) {
  x_ -= minCorners.x - 1;
  y_ -= minCorners.y - 1;
  int hueSum = 0;
  int satSum = 0;
  int brightSum = 0;
  img.loadPixels();
  for (int i = (int)x_; i < x_ + scl; i++) {
    for (int j = (int)y_; j < y_ + scl; j++) {
      int index = j * img.width + i;
      try {
        hueSum += hue(img.pixels[index]);
        satSum += saturation(img.pixels[index]);
        brightSum += brightness(img.pixels[index]);
      } catch(Exception e) {
        println("Exception Occured: " + e);
        println("pixels.length = " + img.pixels.length);
      }
    }
  }
  hueSum /= scl * scl;
  satSum /= scl * scl;
  brightSum /= scl * scl;
  colorMode(HSB);
  noStroke();
  fill(hueSum, satSum, brightSum);
  ellipse(x_ + scl / 2, y_ + scl / 2, scl * 0.9, scl * 0.9);
}