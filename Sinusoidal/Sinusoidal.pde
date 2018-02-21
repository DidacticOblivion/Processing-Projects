

float a = 1;
float b = 1;
float c = 0;
float d = 0;

float lastX = -1;
float lastY = height / 2;


void setup() {
  size(800,600);
  background(0);
  frameRate(30);
}



void draw() {
  background(0);
  
  stroke(255);
  strokeWeight(3);
  
  a = mouseY;
  b += (mouseX - 50) / 10000f;
  
  println("[DEBUG]: " + ((mouseX - 50) / 10000f));
  
  for (int x = -5; x <= width; x += 3) {
    line(x, s(x), lastX, lastY);
    lastX = x;
    lastY = s(x);
  }
  lastX = -1;
  lastY = height / 2;
}


float s(float _x) {
  return (a * sin(b * _x)) + (25 * sin(_x)) + height / 2;
}