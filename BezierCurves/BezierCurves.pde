PVector cp1;
PVector cp2;
float cpR = 10;

boolean debug = false;

void setup() {
  cp1 = new PVector(width / 3, height / 2);
  cp2 = new PVector(width - width / 3, height / 2);
  
  size(800, 600);
  background(42);
  stroke(255);
  strokeWeight(2);
  noFill();
  bezier(0, height / 2, cp1.x, cp1.y, cp2.x, cp2.y, width, height / 2);
  stroke(200, 255, 0);
  line(0, height / 2, cp1.x, cp1.y);
  line(cp2.x, cp2.y, width, height / 2);
  stroke(60, 100, 255);
  strokeWeight(cpR * 2);
  point(cp1.x, cp1.y);
  point(cp2.x, cp2.y);
}

void mouseDragged() {
  if (mouseX > cp1.x - cpR && mouseX < cp1.x + cpR && mouseY > cp1.y - cpR && mouseY < cp1.y + cpR) {
    cp1.x = mouseX;
    cp1.y = mouseY;
  }
  if (mouseX > cp2.x - cpR && mouseX < cp2.x + cpR && mouseY > cp2.y - cpR && mouseY < cp2.y + cpR) {
    cp2.x = mouseX;
    cp2.y = mouseY;
  }
}

void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

void draw() {
  background(42);
  stroke(255);
  strokeWeight(2);
  noFill();
  bezier(0, height / 2, cp1.x, cp1.y, cp2.x, cp2.y, width, height / 2);
  if (debug) {
    stroke(200, 255, 0);
    line(0, height / 2, cp1.x, cp1.y);
    line(cp2.x, cp2.y, width, height / 2);
  }
  stroke(60, 100, 255);
  strokeWeight(cpR * 2);
  point(cp1.x, cp1.y);
  point(cp2.x, cp2.y);
}