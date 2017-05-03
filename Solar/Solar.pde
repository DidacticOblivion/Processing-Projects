Star star;

PVector center;
boolean dragging = false;

Background space;

void setup() {
  size(1200, 900);
  space = new Background(floor(1.1 * width), floor(1.1 * height));

  center = new PVector(width / 2, height / 2);
  star = new Star(5);
}

void draw() {
  clear();
  space.show();
  translate(center.x * 0.9, center.y * 0.9);
  scale(zoom);

  star.show();

  if (mousePressed && dragging) {
    center.x += mouseX - pmouseX;
    center.y += mouseY - pmouseY;
    center.x = constrain(center.x, star.radius * zoom, width - star.radius * zoom);
    center.y = constrain(center.y, star.radius * zoom, height - star.radius * zoom);
  } else {
    dragging = false;
  }
}

void mousePressed() {
  switch (mouseButton) {
  case LEFT:
    star.regen();
    star.regenPlanets();
    break;

  case RIGHT:
    dragging = true;
    break;

  default:
    break;
  }
}

float zoom = 1;
void mouseWheel(MouseEvent event) {
  float e = -event.getCount();
  zoom += e / 10;
  zoom = constrain(zoom, 0.1, 1);
}