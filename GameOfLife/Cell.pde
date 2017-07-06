class Cell {
  color clr = color(109, 100, 31);
  color lineClr = color(109, 50, 20);
  float scl;
  
  PGraphics img;
  
  
  Cell(float _scl) {
    scl = _scl;
  }
  
  void createNew() {
    img = createGraphics(floor(scl), floor(scl));
    img.beginDraw();
    img.stroke(lineClr);
    img.fill(clr);
    img.strokeWeight(2);
    img.ellipse(scl/2, scl/2, scl - 5, scl - 5);
    img.line(scl/2, 10, scl/2, scl - 10);
    img.line(10, scl/2, scl - 10, scl/2);
    img.endDraw();
  }
  
  void show(float x, float y) {
    x -= scl/2;
    y -= scl/2;
    image(img, x, y);
  }
}