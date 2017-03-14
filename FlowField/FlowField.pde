Particle[] particles = new Particle[100];

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
  
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
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
        PVector rot = new PVector(scl / 1.9, scl / 1.9);
        rot.rotate(TWO_PI * noiseVal);
        line(x + scl / 2, y + scl / 2, x + rot.x + scl / 2, y + rot.y + scl / 2);
      }
    }
  }
  timeOff++;
  particles[0].update();
  particles[0].show();
}