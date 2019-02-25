int scl = 20;

float z = 0;

void setup() {
  size(800, 600, P3D);
  background(20);
}


void draw() {
  rotateX(2);
  translate(0, -500, -100);
  
  beginShape();
  noFill();
  stroke(255);
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {      // --- This whole thing does not work in it's current form...
      if (y % scl == 0 && x % scl == 0) {
        vertex(x, y, z);
      }
    }
  }
  endShape(TRIANGLE_STRIP);
}
