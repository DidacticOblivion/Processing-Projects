Star star = new Star();
Planet plnt = new Planet();

void setup() {
  size(1000, 700);
  background(0);
  star.generate();
  plnt.generate();
}

void draw() {
  translate(width / 2, height / 2);
  background(0);
  star.show();
  plnt.show();
}

void mousePressed() {
  star.generate();
  plnt.generate();
}