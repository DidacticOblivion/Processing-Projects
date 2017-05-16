class ColorWheel {
  
  PVector pos;
  float radius;
  float scl;
  
  PGraphics wheel;
  
  //Constructors
  ColorWheel() {
    pos = new PVector(width / 2, height / 2);
    radius = 100;
    scl = radius / 100;
    createWheel();
  }
  
  ColorWheel(float r) {
    pos = new PVector(width / 2, height / 2);
    radius = r;
    scl = radius / 100;
    createWheel();
  }
  
  ColorWheel(PVector p, float r) {
    pos = p;
    radius = r;
    scl = radius / 100;
    createWheel();
  }
  
  
  //Create the wheel
  void createWheel() {
    wheel = createGraphics(width, height);
    wheel.beginDraw();
    wheel.colorMode(HSB, 360, 100, 100);
    wheel.translate(pos.x, pos.y);
    
    //Fill the circle with HSB colors depending on radius and angle
    for (int s = 0; s <= radius; s++) {
      for (int h = 0; h < 360; h++) {
        float x = s * cos(h);
        float y = s * sin(h);
        wheel.stroke(h, s / scl, 100);
        wheel.strokeWeight(scl * 2.2);
        wheel.point(x,y);
      }
    }
    
    wheel.stroke(255);
    wheel.noFill();
    wheel.strokeWeight(1.5);
    wheel.ellipse(0, 0, radius * 2 + 5, radius * 2 + 5);
    wheel.endDraw();
  }
  
  //Draw the wheel
  void show() {
    image(wheel, 0, 0);
  }
}