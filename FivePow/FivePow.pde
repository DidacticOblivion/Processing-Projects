float n = 0;

void setup() {
  size(1000, 800);
  background(255, 0, 255);
}



void draw() {
  loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int index = x + y * width;
      float num = pow((x - width/2), n) + pow((y - height / 2), n);
      if (pow(num, 1/n) % n == 0 && num != 0) {
        pixels[index] = color(255);
        //println("x = " + x + ", y = " + y + "\n");
      } else {
        pixels[index] = color(0);
      }
    }
  }
  updatePixels();
  n = mouseX / (mouseY == 0 ? 1 : mouseY);
}
