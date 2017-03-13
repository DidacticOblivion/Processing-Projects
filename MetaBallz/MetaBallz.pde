//Blob b;
Blob[] blobs = new Blob[5];

public void setup() {
  size(1200,800);
  colorMode(HSB);
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(width), random(height));
  }
  //b = new Blob(100, 100);
}

public void draw() {
  background(51);
  
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float sum = 0;
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 200 * b.r / d;
      }
      
      pixels[index] = color(constrain(sum,0,130),255,255);
    }
  }
  
  updatePixels();
  
  for (Blob b : blobs) {
    b.update();
    //b.show();
  }
}