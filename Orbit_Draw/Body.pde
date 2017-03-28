class Body {
  PVector pos = new PVector(0, 0);
  PVector fpos = new PVector(0, 0);
  float rad;
  float vel;
  float step;
  
  float a;
  float b;
  
  Body(float step_, float a_, float b_) {
    step = step_;
    a = a_;
    b = b_;
    fpos.x = sqrt((a * a) - (b * b));
    fpos.y = sqrt((b * b) - (a * a));
  }
  
  void update() {
    pos.x += 1;
    pos.y = -(pos.x / a) * b;
  }
  
  void show() {
    pushMatrix();
    translate(width/2 - a - fpos.x, height/2);
    fill(100);
    ellipse(pos.x,pos.y,50,50);
    popMatrix();
  }
  
}