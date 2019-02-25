PVector offSet;
PVector hLim, wLim;

float start = 3;
float b = start;

void setup() {
  size(1000, 700);
  background(42);
  
  offSet = new PVector(width / 2, 5 * height / 6);
  hLim = new PVector(0, height);
  wLim = new PVector(0, width);
  
  line(offSet.x, 0, offSet.x, height);
  
  frameRate(10);
}


void draw() {
  int lastI = floor(-offSet.x - 10);
  
  for (int i = -width / 2; i <= width / 2; i++) {
    if (i % 3 == 0) {
      graph(floor(i), floor(b * pow(1.02, i) + 0.5), floor(lastI), floor(b * pow(1.02, lastI) + 0.5));
      lastI = i;
    }
    
  }
  
  b -= 0.1;
  
  if (b == 1/start) {
    noLoop();
  }
}


void graph(int x, int y, int lastX, int lastY) {
  if (x + offSet.x < wLim.x || x + offSet.x > wLim.y) {
    return;
  }
  stroke(255);
  noFill();
  line(offSet.x + x, offSet.y - y, offSet.x + lastX, offSet.y - lastY);
}