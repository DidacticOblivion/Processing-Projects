Particle[] particles = new Particle[1000];
PVector[] flowField;


int scl = 100;

int cols;
int rows;

float noiseScl = 2;
float timeOff = 0;
float timeScl = 0.6;

public void setup() {
  noiseScl /= 100;
  timeScl /= 100;
  
  background(255);
  
  size(600,600);
  
  rows = height / scl;
  cols = width / scl;
  
  flowField = new PVector[rows * cols];
  
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
}

void mouseClicked() {
  noLoop();
}

public void draw() {
  //background(255);
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (y % scl == 0 && x % scl == 0) {
        float angle = noise(x * noiseScl, timeOff * timeScl, y * noiseScl) * TWO_PI * 4;
        PVector v = PVector.fromAngle(angle);
        v.setMag(1);
        int index = x / scl + y / scl * cols;
        flowField[constrain(index, 0, cols * rows)] = v;
        stroke(0);
        strokeWeight(2);
      }
    }
  }
  timeOff++;
  for (Particle i : particles) {
    i.follow(flowField);
    i.update();
    i.edges();
    i.show();
  }
}