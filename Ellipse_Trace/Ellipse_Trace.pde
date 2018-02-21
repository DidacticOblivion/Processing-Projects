
float theta = 0;

float x;
float a = 250;
float b = 100;

void setup() {
  size(800, 600);
  background(0);
}


void draw() {
  background(0);
  translate(width / 2, height / 2);
  
  stroke(42);
  fill(0);
  
  ellipse(0,0,2 * a,2 * b);
  
  stroke(255);
  fill(255);
  
  x = a * cos(theta);
  
  ellipse(x, f(x) * (sin(theta) < 0 ? -1 : 1), 10, 10);
  
  theta += 0.01;
}


float f(float _x) {
  return sqrt(pow(b,2)-(pow(_x, 2) * pow(b, 2)) / pow(a, 2));
}