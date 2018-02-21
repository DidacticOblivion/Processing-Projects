PImage img;

public void setup() {
  size(256, 197);
  background(0);
  
  img = loadImage("IMG_1628.PNG");
  
  img.loadPixels();
  loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    if (img.pixels[i] != color(255)) {
      pixels[i] = color(255);
    }
  }
  updatePixels();
}