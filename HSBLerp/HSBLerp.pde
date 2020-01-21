PVector c1 = new PVector(50, 80, 200);
PVector c2 = new PVector(100, 210, 80);

float scl = 100;
boolean redraw = true;

void setup() {
  size(1600, 800);
}

int lerpHue(float a, float b, float p) {
  float dccw = (a >= b ? a - b : 255 + a - b);
  float dcw = (a >= b ? 255 + b - a : b - a);
  
  float h = (dcw <= dccw ? a + (dcw * p) : a - (dccw * p));
  if (h < 0) {
    h += 255;
  }
  if (h > 255) {
    h -= 255;
  }
  
  return floor(h + 0.5);
}

void draw() {
  noStroke();
  if (redraw) {
    for (int x = 0; x < width; x++) {
      if (x % scl == 0) {
        colorMode(HSB);
        float p = x / (width - scl);
        println(p);
        fill(lerpHue(c1.x, c2.x, p), lerp(c1.y, c2.y, p), lerp(c1.z, c2.z, p));
        rect(x, 0, x + scl, height);
      }
    }
    redraw = false;
  }
}

void keyPressed() {
  switch (key) {
        case 'r':
      c1.set(random(359), random(255), random(255));
      c2.set(random(359), random(255), random(255));
      redraw = true;
      break;
        default:
      break;
  }
}
