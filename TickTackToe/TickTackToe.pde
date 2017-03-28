
GameBoard gb = new GameBoard();

void setup() {
  size(800, 600);
  background(51);
}

void draw() {
  gb.update();
  gb.show();
}