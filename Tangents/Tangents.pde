void setup() {
  size(1080, 720);
  background(20);
  strokeWeight(5);
  stroke(255);
  
  //Draw Stuff Here....
}

void draw() {
  
}

float function(float x) {
  return pow(x, 2) - 0.8;
}

PVector cscl(float x) {
  return new PVector(
    map(x, -1, 1, 0, width),
    map(function(x), -1, 1, height, 0)
  );
}
