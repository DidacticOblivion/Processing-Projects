Particle[] particles = new Particle[5000];
color[] flowColor = new color[particles.length];

PVector[] flowField;


int scl = 5;

int cols;
int rows;

float noiseScl = 1;
float timeOff = 0;
float timeScl = 1;

//Color Stuff
boolean makeColored = true;
boolean darkBackground = true;

float colorStart = 0;
float colorRange = 200;
//End Color Stuff

public void setup() {
  noiseScl /= 100;
  timeScl /= 100;
  if (darkBackground) {
    background(0);
  } else {
    background(255);
  }
  size(600,600);
  
  colorMode(HSB);
  
  rows = height / scl;
  cols = width / scl;
  
  flowField = new PVector[rows * cols];
  
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
    if (makeColored) {
      flowColor[i] = color(random(colorStart, colorRange), 255, 255);
    } else {
      flowColor[i] = color(0);
    }
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
        flowField[constrain(index, 0, cols * rows - 1)] = v;
        stroke(0);
        strokeWeight(2);
      }
    }
  }
  timeOff++;
  for (int i = 0; i < particles.length; i++) {
    particles[i].follow(flowField);
    particles[i].update();
    particles[i].edges();
    particles[i].show(flowColor[i]);
  }
}