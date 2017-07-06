class Grid {
  color bg = color(255);
  color ln = color(0);
  float scl;
  PGraphics gridImage;
  
  float weight = 1;
  
  
  Grid(float _scl) {
    scl = _scl;
  }
  
  Grid(float _scl, color _bg, color _ln) {
    scl = _scl;
    bg = _bg;
    ln = _ln;
  }
  
  void setWeight(float newWeight) {
    weight = newWeight;
  }
  
  void createNew() {
    gridImage = createGraphics(width, height);
    gridImage.beginDraw();
    gridImage.fill(bg);
    gridImage.stroke(ln);
    gridImage.strokeWeight(weight);
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        if (y % scl == 0 && x % scl == 0) {
          gridImage.rect(x, y, scl, scl);
        }
      }
    }
    gridImage.endShape();
  }
  
  void show() {
    image(gridImage, 0, 0);
  }
  
  void show(float x, float y) {
    image(gridImage, x, y);
  }
}