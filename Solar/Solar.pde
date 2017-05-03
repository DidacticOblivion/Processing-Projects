Star star;

PVector center;
boolean dragging = false;

void setup() {
  size(1200, 900);
  center = new PVector(width / 2, height / 2);
  background(0);
  star = new Star(2);
}

void draw() {
  translate(center.x, center.y);
  scale(zoom);
  background(0);
  
  if (mousePressed && dragging) {
    center.x += mouseX - pmouseX;
    center.y += mouseY - pmouseY;
    center.x = constrain(center.x, star.radius * zoom, width - star.radius * zoom);
    center.y = constrain(center.y, star.radius * zoom, height - star.radius * zoom);
  } else {
    dragging = false;
  }
  
  star.show();
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