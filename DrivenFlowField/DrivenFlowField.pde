float scl = 40;

Particle[] particles = new Particle[100];

void setup() {
  fullScreen();
  background(42);
  
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(random(width), random(height), 100);
  }
}


void draw() {
  background(42);
  
  for (int j = 0; j <= height; j++) {
    for (int i = 0; i <= width; i++) {
      if (j % scl == 0 && i % scl == 0) {
        PVector f = field(i,j);
        f.setMag(pow(f.mag(), 0.25));
        PVector c = new PVector(i + scl / 2, j + scl / 2);
        stroke(255, 255, 50);
        line(c.x, c.y, c.x + f.x, c.y + f.y);
        stroke(200, 0, 0);
        fill(200, 0, 0);
        ellipse(c.x, c.y, scl/7, scl/7);
      }
    }
  }
  
  updateParticles(particles);
  drawParticles(particles);
}


void drawParticles(Particle[] ps) {
  for (Particle p : ps) {
    fill(0, 200, 255);
    ellipse(p.pos.x, p.pos.y, 10, 10);
  }
}

void updateParticles(Particle[] ps) {
  for (Particle p : ps) {
    PVector f = field(p.pos.x,p.pos.y);
    f.setMag(pow(f.mag(), 0.25));
    p.update(f);
  }
}


PVector field(float x, float y) {
  PVector result = new PVector();
  
  result.x = pow(y - height / 2, 3) / height;
  result.y = pow(x - width / 2, 2) / height;
  
  return result;
}
