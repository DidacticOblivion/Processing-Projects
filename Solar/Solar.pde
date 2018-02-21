Star star;

boolean showDebug = false;
boolean showStars = true;
float widthH, heightH;

PVector center;
boolean dragging = false;

Background space;

void setup() {
  frameRate(30);
  size(1200, 700);

  widthH = width / 2;
  heightH = height / 2;

  center = new PVector(widthH, heightH);
  space = new Background(width, height);
  star = new Star(5);

  textSize(15);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  pushMatrix();
  clear();
  
  translate(center.x, center.y);
  
  if (showStars) {
    space.show();
  } else {
    background(0);
  }
  
  scale(zoom);
  star.show();
  
  if (mousePressed && dragging) {
    center.x += mouseX - pmouseX;
    center.y += mouseY - pmouseY;
    center.x = constrain(center.x, 0, width);
    center.y = constrain(center.y, 0, height);
  } else {
    dragging = false;
  }
  popMatrix();
  
  //Debug
  if (showDebug) {
    noStroke();
    fill(75, 100, 100);
    text("FPS: " + floor(frameRate + 0.5), 10, 20);
    fill(45, 100, 100);
    rect(widthH, 0, 1, height);
    rect(0, heightH, width, 1);
  }
}

void mousePressed() {
  switch (mouseButton) {
  case LEFT:
    dragging = true;
    break;

  case RIGHT:
    dragging = true;
    break;

  case CENTER:
    showDebug = !showDebug;
    break;

  default:
    break;
  }
}

void keyPressed() {
  switch (key) {
  case 'r':
    center = new PVector(widthH, heightH);
    zoom = 1;
    
  case 's':
    showStars = !showStars;
    break;
    
  default:
    break;
  }

  switch (keyCode) {
  case 32:
    star.regen();
    star.regenPlanets();
    space.generate();
    break;
    
  default:
    break;
  }
}

float zoom = 1;

void mouseWheel(MouseEvent event) {
  float e = -event.getCount();
  zoom += e / 50;
  zoom = constrain(zoom, 0.05, 1);
}