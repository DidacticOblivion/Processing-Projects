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
    for (int i = 0; i < 0.00025 * max.x * max.y; i++) {
      bg.fill(random(50), 75, 100, 100);
      bg.ellipse(random(max.x), random(max.y), 2, 2);
      bg.fill(255, 100);
      bg.ellipse(random(max.x), random(max.y), 2, 2);
      bg.ellipse(random(max.x), random(max.y), 2, 2);
    }
    bg.endDraw();
  }

  void show() {
    image(bg, -max.x * 0.1, -max.y * 0.1);
  }
}