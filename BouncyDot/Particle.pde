class Particle {
  float x;
  float y;
  float D;
  
  void generate(float xin, float yin, float size) {
    x = xin;
    y = yin;
    D = size/10;
  }
  
  void show(float r, float g, float b) {
    noStroke();
    fill(b,g,r);
    ellipse(x,y,D,D);
  }
}