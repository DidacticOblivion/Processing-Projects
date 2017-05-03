Star star = new Star();
Planet[] plnt = new Planet[2];

PVector center;

void setup() {
  size(1200, 900);
  center = new PVector(width / 2, height / 2);
  background(0);
  star.generate();
  for (int i = 0; i < plnt.length; i++) {
    plnt[i] = new Planet(random(TWO_PI), star);
    plnt[i].generate();
  }
}

void draw() {
  translate(center.x, center.y);
  scale(zoom);
  background(0);
  star.show();
  for (Planet p : plnt) {
    p.show();
  }
  
  if (mousePressed && dragging) {
    center.x += mouseX - pmouseX;
    center.y += mouseY - pmouseY;
    center.x = constrain(center.x, star.radius * zoom, width - star.radius * zoom);
    center.y = constrain(center.y, star.radius * zoom, height - star.radius * zoom);
  } else {
    dragging = false;
  }
}

boolean dragging = false;

void mousePressed() {
  switch (mouseButton) {
  case LEFT:
    star.generate();
    for (Planet p : plnt) {
      p.generate();
    }
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