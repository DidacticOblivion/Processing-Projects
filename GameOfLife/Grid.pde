class Grid {
  color ln = color(0, 100);
  float scl;
  PGraphics gridImage;

  float weight = 3;


  Grid(float _scl) {
    scl = _scl;
  }

  Grid(float _scl, color _ln) {
    scl = _scl;
    ln = _ln;
  }

  void setWeight(float newWeight) {
    weight = newWeight;
  }

  void createNew() {
    gridImage = createGraphics(width, height);
    gridImage.beginDraw();
    gridImage.stroke(ln);
    gridImage.strokeWeight(weight);
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        if (y % scl == 0 && x % scl == 0) {
          gridImage.point(x + scl/2, y + scl/2);
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