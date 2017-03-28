class GameBoard {
  
  Piece[] pieces = new Piece[9];
  
  PVector pos = new PVector(width/2, height/2);
  color bg;
  color ln;
  
  GameBoard() {
    bg = color(220);
    ln = color(0);
  }
  
  GameBoard(color bg_) {
    bg = bg_;
    ln = color(0);
  }
  
  GameBoard(color bg_, color ln_) {
    bg = bg_;
    ln = ln_;
  }
  
  void place(Shapes type, int index) {
    if (pieces[index] == null) {
      pieces[index] = new Piece(index, type);
      //println(index);
    } else {
      println("Spot filled already!");
    }
  }
  
  void show() {
    //Background
    strokeWeight(scl/30);
    stroke(ln);
    fill(bg, 75);
    for(int i = 0; i < width - 1; i++) {
      for(int j = 0; j < height - 1; j++) {
        if(i % scl == 0 && j % scl == 0) {
          rect(i,j,scl,scl);
        }
      }
    }
    //Showing Pieces
    for(Piece p : pieces) {
      if(p != null) {
        p.show();
      }
    }
  }
  
  void click(float x_, float y_, int btn) {
    int sel = -1;
    if(x_ <= scl) {
      if(y_ <= scl) {
        sel = 0;
      } else if(y_ > scl && y_ <= 2 * scl) {
        sel = 3;
      } else if(y_ > 2 * scl) {
        sel = 6;
      }
    } else if(x_ > scl && x_ <= 2 * scl) {
      if(y_ <= scl) {
        sel = 1;
      } else if(y_ > scl && y_ <= 2 * scl) {
        sel = 4;
      } else if(y_ > 2 * scl) {
        sel = 7;
      }
    } else if(x_ > 2 * scl) {
      if(y_ <= scl) {
        sel = 2;
      } else if(y_ > scl && y_ <= 2 * scl) {
        sel = 5;
      } else if(y_ > 2 * scl) {
        sel = 8;
      }
    }
    println(sel);
    if(pieces[sel] == null) {
      fill(50,255,30);
    } else {
      fill(200,100,50);
    }
    noStroke();
    rect(getLoc(sel).x - (scl/2), getLoc(sel).y - (scl/2), scl, scl);
    if(btn == LEFT) {
      place(Shapes.O, sel);
    } else {
      place(Shapes.X, sel);
    }
  }
  
  void update() {
    for(int i = 0; i < 9; i++) {
      if(pieces[i] == null) {
        break;
      }
      if(i == 8) {
        reset();
      }
    }
  }
  
  void reset() {
    pieces = new Piece[9];
  }
}