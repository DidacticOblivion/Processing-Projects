class ColorWheel {
  
  PVector pos;
  float radius;
  float scl;
  
  PShape wheel;
  
  //Constructors
  ColorWheel() {
    pos = new PVector(width / 2, height / 2);
    radius = 100;
    scl = radius / 100;
  }
  
  ColorWheel(float r) {
    pos = new PVector(width / 2, height / 2);
    radius = r;
    scl = radius / 100;
  }
  
  ColorWheel(PVector p, float r) {
    pos = p;
    radius = r;
    scl = radius / 100;
  }
  
  
  //Create the wheel
  void createWheel() {
    wheel = createShape();
    wheel.beginShape();
    wheel.colorMode(HSB);
    wheel.translate(pos.x, pos.y);
    
    //Fill the circle with HSB colors depending on radius and angle
    for (int h = 0; h < 360; h++) {
      for (int s = 0; s <= radius; s++) {
        float x = s * cos(h);
        float y = s * sin(h);
        wheel.stroke(h, s / scl, 100);
        wheel.strokeWeight(scl * 2);
        wheel.createShape(ELLIPSE, x, y, 1, 1);
      }
    }
    
    wheel.stroke(255);
    wheel.noFill();
    wheel.ellipse(0, 0, radius * 2 + 5, radius * 2 + 5);
    wheel.endShape();
  }
  
  //Draw the wheel
  void show() {
    
  }
}