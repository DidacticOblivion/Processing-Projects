int scl = 50;
float it = 0;
float flow = 0;

void setup() {
  size(600,600,P3D);
  lights();
  noFill();
  noStroke();
  strokeWeight(5);
  colorMode(HSB);
}

void draw() {
  background(42);
  scale(0.5);
  translate(width, height);
  rotateX(it);
  rotateY(it);
  float xoff = flow;
  for (int x = -200; x < 201; x++) {
    float yoff = 0;
    for (int y = -200; y < 201; y++) {
      float zoff = 0;
      for (int z = -200; z < 201; z++) {
        if (dist(x,y,z,0,0,0) < 250) {
          if (z % scl == 0 && y % scl == 0 && x % scl == 0) {
            pushMatrix();
            stroke(360 * noise(xoff, yoff, zoff), 255, 255);
            //fill(255 * noise(xoff, yoff, zoff));
            translate(x, y, z);
            box(scl - 0.1);
            popMatrix();
          }
        }
        zoff += 0.002;
      }
      yoff += 0.002;
    }
    xoff += 0.002;
  }
  it += 0.01;
  flow += 0.05;
  
  saveFrame("Movie/####.png");
}