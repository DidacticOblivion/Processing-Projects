PVector f = new PVector(width / 2, height / 2);
PVector l = new PVector();

int scl = 5;
float rate = 0.1;

void setup() {
  size(800, 600);
  background(42);
  
  stroke(255);
  strokeWeight(5);
  step(20);
}


void step(int arg) {
  if (arg == 0) {
    return;
  } else {
    step(arg - 1);
  }
  
  l.set(
  f.x + (scl * cos(map(noise(f.x, f.y), 0, 255, 0, TWO_PI) * rate)),
  f.y + (scl * sin(map(noise(f.x, f.y), 0, 255, 0, TWO_PI) * rate))
  );
  
  line(f.x, f.y, l.x, l.y);
  
  f = l;
  
  return;
}