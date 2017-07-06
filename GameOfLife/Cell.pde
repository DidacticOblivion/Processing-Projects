class Cell {
  color clr = color(100, 210, 100);
  color lineClr = color(100, 200, 80);
  color deathClr = color(200, 175, 80);
  color deathLineClr = color(200, 165, 60);
  float scl;
  
  
  boolean show = false;
  boolean lastShow = false;

  float x, y;

  PGraphics imgLive;
  PGraphics imgDie;


  Cell(float _scl, float x_, float y_) {
    scl = _scl;
    x = x_ + scl/2;
    y = y_ + scl/2;

    createNew();
  }

  void createNew() {
    //Sprite for living cell
    imgLive = createGraphics(floor(scl), floor(scl));
    imgLive.beginDraw();
    imgLive.stroke(lineClr);
    imgLive.fill(lineClr);
    imgLive.strokeWeight(2);
    imgLive.ellipse(scl/2, scl/2, scl - 5, scl - 5);
    imgLive.fill(clr);
    imgLive.ellipse(scl/2, scl/2, scl - 20, scl - 20);
    imgLive.endDraw();
    //Sprite for dying cell
    imgDie = createGraphics(floor(scl), floor(scl));
    imgDie.beginDraw();
    imgDie.stroke(deathLineClr);
    imgDie.fill(deathLineClr);
    imgDie.strokeWeight(2);
    imgDie.ellipse(scl/2, scl/2, scl - 5, scl - 5);
    imgDie.fill(deathClr);
    imgDie.ellipse(scl/2, scl/2, scl - 20, scl - 20);
    imgDie.endDraw();
  }

  void update() {
    if (show) {
      image(imgLive, x - scl/2, y - scl/2);
    } else if (lastShow && !show) {
      image(imgDie, x - scl/2, y - scl/2);
    }
  }
}