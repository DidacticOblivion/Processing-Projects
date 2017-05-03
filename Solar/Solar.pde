Star star = new Star();
Planet plnt;

void setup() {
  size(1000, 700);
  background(0);
  star.generate();
  plnt = new Planet(70, 180, star);
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