ArrayList<Seed> s = new ArrayList<Seed>();

PVector sPos = new PVector(random(width), random(height));

int tries = 0;

int addEach = 50;  // <-- Number of circles to add each time after initial spawn

void setup() {
  size(1000, 600);
  background(42);
  colorMode(HSB);
  addSeed(10);
}

void draw() {
  background(42);
  for (Seed seed : s) {
    seed.update(s);
    seed.show();
  }
  boolean allStop = true;
  for (Seed seed : s) {
    if (seed.grow) {
      allStop = false;
      break;
    }
  }
  if (allStop) {
    addSeed(addEach);
  }
}

void genPos() {
  sPos = new PVector(random(width), random(height));
  for (Seed seed : s) {
    if (dist(sPos.x, sPos.y, seed.pos.x, seed.pos.y) <= seed.r + 5 && tries <= 1000) {
      tries++;
      genPos();
      break;
    }
    if (tries == 1000) {
      noLoop();
      capture();
      exit();
    }
  }
}

void addSeed(int n) {
  for (int i = 0; i < n; i++) {
    tries = 0;
    genPos();
    s.add(new Seed(sPos.x, sPos.y));
  }
}

void capture() {
  saveFrame("ScreenShots/ScreenShot_##");
  println("Image saved!");
}