Orbit obit = new Orbit(0,200,150,200);

void setup() {
  size(1000,800);
  translate(width/2,height/2);
  background(0);
}

void draw() {
  translate(width/2,height/2);
  fill(0,20);
  rect(-width/2,-height/2,width,height);
  
  noStroke();
  fill(255);
  ellipse(obit.f,0,50,50);
  ellipse(obit.x,obit.y,10,10);
  obit.updateOrbit();
}