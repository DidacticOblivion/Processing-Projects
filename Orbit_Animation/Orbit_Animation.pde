float d = 150;
Planet plnt = new Planet(150, 0.2);
Planet plnt2 = new Planet(250, 0.05);
Moon mun = new Moon(40, -0.3);

void setup() {
  size(600,600);
  colorMode(HSB);
}

void draw() {
  translate(width/2,height/2);
  background(0);
  stroke(30,255,255);
  strokeWeight(d/20);
  fill(35,255,255);
  ellipse(0, 0, d, d);
  
  plnt.update();
  plnt.show();
  plnt2.update();
  plnt2.show();
  translate(plnt.pos.x, plnt.pos.y);
  mun.update();
  mun.show();
}