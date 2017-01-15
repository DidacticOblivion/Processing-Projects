class planet {
  
  float x = 0;
  float y = 0;
  float d;
  
  float a = 0;
  float b = 0;
  
  color clr1 = color(random(360),random(30,70),random(40,70));
  color clr2 = color(random(360),random(30,70),random(40,90));
  
  public planet(float _a, float _b) {
    a = _a;
    b = _b;
    d = random(20,100);
  }
  
  public planet(float _a, float _b, float _d) {
    a = _a;
    b = _b;
    d = _d;
  }
  
  public void render(float _x, float _y) {
    strokeWeight(5);
    stroke(clr1);
    fill(clr2);
    x = _x;
    y = _y;
    ellipse(x, y, d, d);
  }
  
}