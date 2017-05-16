class Background {

  PGraphics bg;
  PVector max;

  Background(int x, int y) {
    max = new PVector(x, y);
    generate();
  }

  void generate() {
    bg = createGraphics((int)max.x, (int)max.y);
    bg.beginDraw();
    bg.colorMode(HSB, 360, 100, 100);
    bg.noStroke();
    bg.fill(0);
    bg.rect(0, 0, max.x, max.y);
    for (int i = 0; i < 0.0005 * max.x * max.y; i++) {
      bg.stroke(random(50), 100, 100, 100);
      bg.strokeWeight(1);
      bg.point(random(max.x), random(max.y));
      bg.stroke(255, 100);
      bg.point(random(max.x), random(max.y));
      bg.stroke(255, 200);
      bg.point(random(max.x), random(max.y));
    }
    bg.endDraw();
  }

  void show() {
    image(bg, -center.x, -center.y);
  }
}