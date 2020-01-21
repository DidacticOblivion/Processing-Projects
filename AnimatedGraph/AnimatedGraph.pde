

void setup() {
  size(1600, 800);
}


void draw() {
  background(30);
  drawGraphs();
}

float yscale = 1;

void drawGraphs() {
  stroke(100, 100, 255);
  line(3 * width / 12, height / 10, 3 * width / 12, 9 * height / 10);
  line(width / 12, (9 * height / 10) - function(2), 5 * width / 12, (9 * height / 10) - function(2));
  
  //First Graph Trace
  float px = 0;
  for (float x = 0; x < 1; x += 0.01) {
    float y = function(x) * yscale;
    float py = function(px) * yscale;
    stroke(255, 100, 0);
    line((width / 12) + (x * 4 * width / 12), (9 * height / 10) - (y * 8 * height / 10), (width / 12) + (px * 4 * width / 12), (9 * height / 10) - (py * 8 * height / 10));
    px = x;
  }
  
  //Second Graph Trace
  px = 0;
  for (float x = 0; x < 1; x += 0.01) {
    float y = dFunction(x) * yscale;
    float py = dFunction(px) * yscale;
    stroke(255, 100, 0);
    line((7 * width / 12) + (x * 4 * width / 12), (9 * height / 10) - (y * 8 * height / 10), (7 * width / 12) + (px * 4 * width / 12), (9 * height / 10) - (py * 8 * height / 10));
    px = x;
  }
  
  //Graph axis and grid marks
  strokeWeight(2);
  stroke(200, 200, 100);
  noFill();
  line(width / 12, height / 10, width / 12, 9 * height / 10);
  line(width / 12, 9 * height / 10, 5 * width / 12, 9 * height / 10);
  
  line(7 * width / 12, height / 10, 7 * width / 12, 9 * height / 10);
  line(7 * width / 12, 9 * height / 10, 11 * width / 12, 9 * height / 10);
  
  for (int i = 2; i < 11; i++) {
    if (i != 6) {
      line(i * width / 12, 9 * height / 10 - 5, i * width / 12, 9 * height / 10 + 5);
    }
  }
}

float function(float x) {
  return pow(x, 5);
}

float dFunction(float x) {
  return 5 * pow(x, 4);
}
