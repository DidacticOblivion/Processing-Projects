Slider s;

void setup() {
  size(800, 200);
  background(42);
  colorMode(HSB, 360, 100, 100);
  s = new Slider(new PVector(width / 4, height / 2), width / 2, 10, 0);
}

float x = 0;
void draw() {
  background(42);
  s.percent = noise(x);
  x += 0.01;
  
  s.show();
}