Background bg;

void setup() {
  size(1200, 800);
  bg = new Background(width, height);
}

void draw() {
  clear();
  bg.show();
}