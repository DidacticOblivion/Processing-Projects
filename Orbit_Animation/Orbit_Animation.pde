float d = 150;

Planet[] planets = new Planet[floor(random(1, 3) + 0.5)];

void setup() {
  size(600,600);
  colorMode(HSB);
  
  for (int i = 0; i < planets.length; i++) {
    planets[i] = new Planet(random(100, 300), random(0.1, 0.5));
    planets[i].spawnMoons();
  }
}

void draw() {
  translate(width/2,height/2);
  background(0);
  stroke(30,255,255);
  strokeWeight(d/20);
  fill(35,255,255);
  ellipse(0, 0, d, d);
  
  for (Planet p : planets) {
    p.update();
    p.show();
  }
}