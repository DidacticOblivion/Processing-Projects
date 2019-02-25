Orbit o;

void setup() {
  size(1200, 700);
  background(0);
  
  o = new Orbit(width / 2 - 200, height / 2, 500, 100);
}


void draw() {
  background(0);
  noFill();
  stroke(42);
  ellipse(o.pCoords.x, o.pCoords.y, 2 * o.a, 2 * o.b);
  
  noStroke();
  fill(255, 255, 100);
  ellipse(o.foc.x, o.foc.y, 20, 20);
  
  fill(100, 255, 255);
  ellipse(o.x(o.step), o.y(o.step), 10, 10);
  
  o.step -= o.vel(o.step);
}