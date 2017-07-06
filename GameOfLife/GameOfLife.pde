float scl = 50;

Grid grid = new Grid(scl);

void setup() {
  size(1200, 800, P2D);
  background(255);
  colorMode(HSB, 360, 100, 100);
  grid.createNew();
}

void draw() {
  grid.show();
}