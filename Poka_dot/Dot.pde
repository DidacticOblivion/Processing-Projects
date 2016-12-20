class Dot {
  
  float x;
  float y;
  float D;
  
  void generate() {
    D = random(-10,10);
    x = random(D,width-D);
    y = random(D,height-D);
  }
  
}