enum Shapes {X, O}

class Piece {
  
  PVector pos = new PVector(0, 0);
  PShape shape;
  
  Piece(int loc, Shapes type) {
    pos.x = getLoc(loc).x;
    pos.y = getLoc(loc).y;
    create(type);
  }
  
  void create(Shapes s) {
    int thick = scl / 10;
    switch(s) {
      case X:
        PShape ex = createShape();
        ex.beginShape();
        ex.noStroke();
        ex.fill(255,10,10);
        ex.vertex(scl/2 - thick, 0);
        ex.vertex(scl/2 + thick, 0);
        ex.vertex(scl/2 + thick, scl/2 - thick);
        ex.vertex(scl, scl/2 - thick);
        ex.vertex(scl, scl/2 + thick);
        ex.vertex(scl/2 + thick, scl/2 + thick);
        ex.vertex(scl/2 + thick, scl);
        ex.vertex(scl/2 - thick, scl);
        ex.vertex(scl/2 - thick, scl/2 + thick);
        ex.vertex(0, scl/2 + thick);
        ex.vertex(0, scl/2 - thick);
        ex.vertex(scl/2 - thick, scl/2 - thick);
        ex.endShape(CLOSE);
        ex.translate(scl/2, scl/-5);
        ex.rotate(PI/4);
        shape = ex;
        break;
      case O:
        stroke(100,200,255);
        strokeWeight(scl / 10);
        noFill();
        PShape circ = createShape(ELLIPSE, scl/2, scl/2, scl - 2 * thick, scl - 2 * thick);
        shape = circ;
        break;
    }
  }
  
  void show() {
    shape(shape, pos.x - (scl/2), pos.y - (scl/2));
  }
  
}