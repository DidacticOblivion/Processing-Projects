Bot drone;

void setup() {
  size(1200, 800, P2D);
  background(42);
  drone = new Bot();
}

void keyPressed() {
  switch (key) {
  case 'a':
    drone.applyForce(new PVector(-1, 0));
    break;
  case 'd':
    drone.applyForce(new PVector(1, 0));
    break;
  case 'w':
    drone.applyForce(new PVector(0, -1));
    break;
  case 's':
    drone.applyForce(new PVector(0, 1));
    break;
  case ' ':
    drone.vel = new PVector(0, 0);
    break;
  default:
    break;
  }
}

void draw() {
  background(42);
  drone.update();
}