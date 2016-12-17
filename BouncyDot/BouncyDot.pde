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
  background(20);
  b.move();
  
  if (drawn.size() == parts.length) {
    for (int i = 1; i < drawn.size(); i++) {
      drawn.set(i-1,drawn.get(i));
      if (i == drawn.size()) {
        drawn.remove(drawn.size());
      }
    }
  }
  parts[i].generate(b.x,b.y,b.D);
  drawn.add(parts[i]);
  
  for (Particle i : drawn) {
    i.show(b.red,b.grn,b.blu);
  }
  
  i += 1;
  
  if (i == parts.length) {
    i = 0;
  }
}