ArrayList<PVector> heart = new ArrayList<PVector>();
ArrayList<PVector> points = new ArrayList<PVector>();
int lastPoints = -1;

float safeZone = 75;

int totalFrames = 240;
float currentFrame = 0;

boolean shouldRecord = true;

void setup() {
  size(600, 600);
  background(150, 100, 150);
  for (int i = 0; i < totalFrames; i++) {
    float a = map(i, 0, totalFrames - 1, 0, TWO_PI);
    float x = pow(cos(a), 3);
    float y = -(0.5 + sin(a) - 0.6 * pow(sin(a), 4) - 0.3 * pow(sin(a), 3));
    heart.add(new PVector(x, y));
  }
}


void draw() {
  currentFrame = (currentFrame == totalFrames ? 1 : currentFrame + 1);
  
  float percent = currentFrame / totalFrames;
  render(percent);
  
  if (shouldRecord) {
    saveFrame("render/frame_###.png");
    
    if (currentFrame == totalFrames) {
      exit();
    }
  }
  
  print(currentFrame + " / " + totalFrames + " = " + percent + "\n");
}


void render(float p) {
  background(150, 100, 150);
  
  //  Heart ------------------------------------------------------------------------------------------
  if (p <= 0.33) {
    float a = map(p, 0, 0.32, 0, TWO_PI);
    float x = pow(cos(a), 3);
    float y = 0.5 + sin(a) - 0.6 * pow(sin(a), 4) - 0.3 * pow(sin(a), 3);
    points.add(new PVector(x, y));
  } else if (p > 0.5 && points.size() > 0) {
    points.remove(0);
  }
  
  noStroke();
  fill(200, 0, 50);
  
  beginShape();
  vertex(width / 2, height / 2);
  for (PVector v : points) {
    vertex(map(v.x, -1, 1, safeZone, width - safeZone), map(v.y, -1, 1, height - safeZone, safeZone));
  }
  endShape();
  
  float r = pow(sin(map(p, 0, 1, 0, PI)), 2);
  beginShape();
  for (PVector v : heart) {
    vertex(75 + r * 50 * v.x, 450 + r * 50 * v.y);
  }
  endShape();
  r = pow(sin(map(p, 0, 1, 0, 3 * PI)), 2);
  beginShape();
  for (PVector v : heart) {
    vertex(150 + r * 30 * v.x, 500 + r * 30 * v.y);
  }
  endShape();
  r = pow(sin(map(p, 0, 1, PI / 2, 3 * PI / 2)), 2);
  beginShape();
  for (PVector v : heart) {
    vertex(500 + r * 60 * v.x, 475 + r * 60 * v.y);
  }
  endShape();
}
