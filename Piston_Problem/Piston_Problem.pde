
PVector pos;
int r = 200;
int l = 900;

int tSet = 30;

float theta = 0;

void setup() {
  size(1200, 700);
  background(200);

  pos = new PVector(width / 2 - 250, height / 2);
}


void draw() {
  background(200);
  textSize(25);

  noFill();
  strokeWeight(10);
  stroke(0);
  ellipse(pos.x, pos.y, 2 * r, 2 * r);

  line((r * cos(6 * PI * theta)) + pos.x, (r * sin(6 * PI * theta)) + pos.y, f(theta), pos.y);
  text("(" + floor((r * cos(6 * PI * theta)) + pos.x) + ", " + floor((r * sin(6 * PI * theta)) + pos.y) + ")", (r * cos(6 * PI * theta)) + pos.x + tSet, (r * sin(6 * PI * theta)) + pos.y);
  text("(" + floor(f(theta)) + ", " + floor(pos.y) + ")", f(theta) + tSet, pos.y);
  
  strokeWeight(25);
  stroke(255);
  point(f(theta), pos.y);
  
  point((r * cos(6 * PI * theta)) + pos.x, (r * sin(6 * PI * theta)) + pos.y);
  
  if (sin(6 * PI * theta) < 0) {
    stroke(100, 255, 150);
  } else {
    stroke(255, 100, 100);
  }
  strokeWeight(5);
  line((r * cos(6 * PI * theta)) + pos.x, pos.y, (r * cos(6 * PI * theta)) + pos.x, (r * sin(6 * PI * theta)) + pos.y);
  line((r * cos(6 * PI * theta)) + pos.x, pos.y, f(theta), pos.y);

  theta -= 0.0005;
}

float f(float x) {
  float a = pow(l, 2) - ((pow(r,2) * pow(sin(6 * PI * x), 2)));
  float b = r * cos(6 * PI * x);
  
  return sqrt(a) + b;
}