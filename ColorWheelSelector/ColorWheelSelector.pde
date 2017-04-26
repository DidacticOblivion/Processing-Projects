ColorWheel cw;

void setup() {
  size(500, 500);
  background(255);
  
  cw = new ColorWheel(250);
}

void draw() {
  background(255);
  cw.show();
}