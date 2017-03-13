int scl = 5;

int cols;
int rows;

public void setup() {
  size(1550,1000);
  background(255);
  
  rows = height / scl;
  cols = width / scl;
}

public void draw() {
  for (int i = 0; i < width; i += scl) {
    for (int j = 0; j < height; j += scl) {
      stroke(noise(sin(i * j)) * 255);
      fill(noise(sin(i * j)) * 255);
      rect(i,j,scl - 1,scl - 1);
    }
  }
}