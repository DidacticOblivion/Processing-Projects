ColorWheel cw;

void setup() {
  size(550, 550);
  background(255);
  
  cw = new ColorWheel(250);
}

void draw() {
  background(255);
  cw.show();
}