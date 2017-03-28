Body b = new Body(1, 200, 100);

void setup() {
  size(1000,800);
  background(255);
}

void draw() {
  fill(0,20);
  rect(0, 0, width, height);
  
  noStroke();
  fill(255);
  ellipse(width/2, height/2, 100, 100);
  
  b.update();
  b.show();
  
}