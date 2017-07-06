float scl = 20;

boolean playing = false;
int iterations = 0;

//Grid grid = new Grid(scl);
Cell[][] cells;


void setup() {
  size(1200, 800, P2D);
  cells = new Cell[floor(width/scl)][floor(height/scl)];
  background(255);
  //grid.createNew();

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      if (x % scl == 0 && y % scl == 0) {
        cells[floor(x / scl)][floor(y / scl)] = new Cell(scl, x, y);
      }
    }
  }
}




void draw() {
  background(255);
  //grid.show();

  //Actual game logic
  if (playing) {
    for (int x = 1; x < floor(width/scl) - 1; x++) {
      for (int y = 1; y < floor(height/scl) - 1; y++) {

        //Check for neighbors in surrounding 3x3
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            neighbors += (cells[x+i][y+j].show ? 1 : 0);
          }
        }
        neighbors -= (cells[x][y].show ? 1 : 0);

        //Rules of Life
        if (cells[x][y].show && neighbors < 2) { // Loneliness
          cells[x][y].show = false;
        } else if (cells[x][y].show && neighbors > 3) { // Overpopulation
          cells[x][y].show = false;
        } else if (!cells[x][y].show && neighbors == 3) { // Reproduction
          cells[x][y].show = true;
        }
      }
    }
  }


  for (Cell[] ce : cells) {
    for (Cell c : ce) {
      if (mousePressed && !playing) {
        iterations = 0;
        if (mouseX > c.x - scl/2 && mouseX < c.x + scl/2 && mouseY > c.y - scl/2 && mouseY < c.y + scl/2) {
          switch (mouseButton) {
          case LEFT:
            c.show = true;
            break;
          case RIGHT:
            c.show = false;
            break;
          }
        }
      }
      c.update();
    }
  }

  if (!playing) {
    noFill();
    stroke(200, 75, 75, 100);
    strokeWeight(20);
    rect(1, 1, width-2, height-2);
  } else {
    iterations++;
  }

  textSize(30);
  fill(0, 100);
  text("Iterations: " + iterations, 5, 35);
}




void keyPressed() {
  switch (keyCode) {
  case 32: //  spacebar
    playing = !playing;
    frameRate(playing ? 24 : 60);
    break;
  case 82: //  "R"
    iterations = 0;
    if (!playing) {
      for (Cell[] ce : cells) {
        for (Cell c : ce) {
          c.show = (random(10) <= 1);
        }
      }
    }
    break;
  case 67: //  "C"
    iterations = 0;
    if (!playing) {
      for (Cell[] ce : cells) {
        for (Cell c : ce) {
          c.show = false;
        }
      }
    }
    break;
  }
}