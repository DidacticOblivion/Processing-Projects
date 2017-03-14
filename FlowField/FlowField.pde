int scl = 30;

int cols;
int rows;

float noiseScl = 0.5;
float timeOff = 0;
float timeScl = 1;

public void setup() {
  noiseScl /= 100;
  timeScl /= 100;
  
  background(255);
  
  size(600,600);
  
  rows = height / scl;
  cols = width / scl;
}

void mousePressed() {
  timeOff = random(-100,100);
}

public void draw() {
  background(255);
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (y % scl == 0 && x % scl == 0) {
        float noiseVal = noise(x * noiseScl, timeOff * timeScl, y * noiseScl);
        stroke(0);
        strokeWeight(2);
        PVector rot = new PVector(scl / 2, scl / 2);
        rot.rotate(TWO_PI * noiseVal);
        line(x, y, x + rot.x, y + rot.y);
      }
    }
  }
  timeOff++;
}