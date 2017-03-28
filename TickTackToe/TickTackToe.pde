
int boardSize = 800;
int scl;
GameBoard game = new GameBoard();

void setup() {
  size(800,800);
  scl = boardSize / 3;
  background(game.bg);
}

void mouseClicked() {
  game.click(mouseX,mouseY,mouseButton);
}

void draw() {
  game.show();
  game.update();
}

PVector getLoc(int index) {
  PVector rVar = new PVector();
  switch(index) {
      case 0:
        rVar.x = scl/2;
        rVar.y = scl/2;
        break;
      case 1:
        rVar.x = scl/2 + scl;
        rVar.y = scl/2;
        break;
      case 2:
        rVar.x = scl/2 + (2 * scl);
        rVar.y = scl/2;
        break;
      case 3:
        rVar.x = scl/2;
        rVar.y = scl/2 + scl;
        break;
      case 4:
        rVar.x = scl/2 + scl;
        rVar.y = scl/2 + scl;
        break;
      case 5:
        rVar.x = scl/2 + (2 * scl);
        rVar.y = scl/2 + scl;
        break;
      case 6:
        rVar.x = scl/2;
        rVar.y = scl/2 + (2 * scl);
        break;
      case 7:
        rVar.x = scl/2 + scl;
        rVar.y = scl/2 + (2 * scl);
        break;
      case 8:
        rVar.x = scl/2 + (2 * scl);
        rVar.y = scl/2 + (2 * scl);
        break;
  }
  return rVar;
}