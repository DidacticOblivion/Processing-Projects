Particle[] particles = new Particle[5000];
color[] flowColor = new color[particles.length];

PVector[] flowField;

int scl = 10;

int cols;
int rows;

float noiseScl = 0.5;
float timeOff = 0;
float timeScl = 1;
float mag = 1;


////// Color  Stuff //////
    boolean makeColored = false;
    boolean darkBackground = false;
    
    float colorStart = 100;
    float colorRange = 200;
//////End Color Stuff//////


int mousePri;
int mouseSec;

boolean run = true;



void prepGraphics() {
  if (darkBackground) {
    background(0);
  } else {
    background(255);
  }
  
  colorMode(HSB);
  
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
    if (makeColored) {
      flowColor[i] = color(random(colorStart, colorRange), 255, 255);
    } else if (!makeColored && darkBackground) {
      flowColor[i] = color(255);
    } else {
      flowColor[i] = color(0);
    }
  }
}



void setup() {
  size(1200, 720);
  pixelDensity(displayDensity());
  
  noiseScl /= 100;
  timeScl /= 100;
  
  rows = height / scl;
  cols = width / scl;
  
  flowField = new PVector[rows * cols];
  prepGraphics();
}



void mouseClicked() {
  if (mouseButton == LEFT) {
    //Pause/Unpause
    run = !run;
  }
  if (mouseButton == RIGHT) {
    //Save Image
    saveFrame("Screen_Shot_##.png");
    println("Image Saved!");
  }
}



void keyPressed() {
  switch (key) {
    case ' ':
      darkBackground = !darkBackground;
      prepGraphics();
      break;
    case 'c':
      makeColored = !makeColored;
      prepGraphics();
      break;
    case 'r':
      prepGraphics();
      break;
  }
}



void draw() {
  if (run) {
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        if (y % scl == 0 && x % scl == 0) {
          float angle = noise(x * noiseScl, timeOff * timeScl, y * noiseScl) * TWO_PI * 4;
          PVector v = PVector.fromAngle(angle);
          v.setMag(mag);
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
}