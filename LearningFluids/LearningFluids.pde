float scl = 20;

FluidPoint[] FPs = new FluidPoint[500];

int mForceRange = 200;

void setup() {
  size(1200, 800);
  createGrid();

  for (int i = 0; i < FPs.length; i++) {
    FPs[i] = new FluidPoint(random(5, width - 5), random(5, height - 5), random(5, 20));
    FPs[i].applyForce(random(-5, 5), random(-5, 5));
  }
}


void draw() {
  createGrid();
  
  noFill();
  stroke(100, 200, 200, 100);
  strokeWeight(5);
  ellipse(mouseX, mouseY, 2 * mForceRange, 2 * mForceRange);

  for (FluidPoint fp : FPs) {
    fp.update();

    //Fun chaos stuff!
    PVector force = new PVector();
    force.lerp(new PVector(width/2, height/2).sub(fp.pos), 0.05);
    force.limit(force.mag() / 10);
    fp.applyForce(force);
  }
}


void mouseDragged() {
  if (mouseButton == LEFT || mouseButton == RIGHT) {
    for (FluidPoint fp : FPs) {
      if (dist(mouseX, mouseY, fp.pos.x, fp.pos.y) <= mForceRange) {
        PVector force = new PVector();
        force.lerp(new PVector(mouseX, mouseY).sub(fp.pos), 0.05);
        force.limit(2);
        fp.applyForce(force.mult(mouseButton == RIGHT ? -1 : 1));
      }
    }
  }
}

void mouseWheel(MouseEvent e) {
  mForceRange += e.getCount() * -20;
  if (mForceRange > 500 || mForceRange < 50) {
    mForceRange = mForceRange > 500 ? 500 : 50;
  }
}

void mousePressed() {
  if (mouseButton == CENTER) {
    mForceRange = 200;
  }
}


void createGrid() {
  background(255);
  noFill();
  stroke(0);
  strokeWeight(1);
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (x % scl == 0 && y % scl == 0) {
        rect(x, y, scl, scl);
      }
    }
  }
}