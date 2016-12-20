Dot b = new Dot();
Particle[] parts = new Particle[50];
ArrayList<Particle> drawn = new ArrayList<Particle>();

int i = 0;

void setup() {
  
  size(800,600);
  
  for (int i = 0; i < parts.length; i++) {
    parts[i] = new Particle();
  }
  
  b = new Dot();
  b.generate();
}

void draw() {
  if (b.red < 100 && b.grn < 100 && b.blu < 100) {
    background(155);
  } else {
    background(0);
  }
  
  if (drawn.size() == parts.length) {
    for (int i = 1; i < drawn.size(); i++) {
      drawn.set(i-1,drawn.get(i));
      if (i == drawn.size()) {
        drawn.remove(drawn.size());
      }
    }
  }
  parts[i].generate(random(b.x,b.x + b.D/3) - b.D/5,random(b.y,b.y + b.D/3) - b.D/5,b.D);
  drawn.add(parts[i]);
  
  for (Particle i : drawn) {
    i.show(b.red,b.grn,b.blu);
  }
  
  b.move();
  
  i += 1;
  
  if (i == parts.length) {
    i = 0;
  }
}