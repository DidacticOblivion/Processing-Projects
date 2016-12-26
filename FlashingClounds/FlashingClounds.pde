float scl = 5;
float nScl = 1;
enum Colors {RED, GREEN, BLUE}
Colors selColor;

void generate() {
  int sel = floor(random(1,3) + 0.5);
  switch (sel) {
    case 1:
      selColor = Colors.RED;
      break;
    case 2:
      selColor = Colors.GREEN;
      break;
    case 3:
      selColor = Colors.BLUE;
      break;
  }
  float noiseScl = random(nScl/100);
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (y % scl == 0 && x % scl == 0) {
        float noiseVal = noise(x * noiseScl, y * noiseScl);
        switch (selColor) {
          case RED:
            fill(255,0,0,200 * noiseVal);
            break;
          case GREEN:
            fill(50,200,50,200 * noiseVal);
            break;
          case BLUE:
            fill(0,0,255,200 * noiseVal);
            break;
        }
        noStroke();
        rect(x,y,scl,scl);
      }
    }
  }
}

void setup() {
  size(700,700);
  background(0);
  generate();
  frameRate(10);
}

void mousePressed() {
  background(0);
  generate();
}

void draw() {
  generate();
}