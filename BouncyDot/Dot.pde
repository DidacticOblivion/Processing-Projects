class Dot {
  float sx;
  float sy;
  float D;
  float x;
  float y;
  float xInc = random(-5,5);
  float yInc = random(-5,5);
  
  float red;
  float grn;
  float blu;
  
  void generate() {
    red = random(255);
    grn = random(255);
    blu = random(255);
    float a = random(155,255);
    D = random(10,50);
    x = random(D,width-D);
    y = random(D,height-D);
    
    strokeWeight(D/10+1);
    fill(red,grn,blu,a);
    
  }
  
  void revX() {
    xInc = -xInc;
  }
  
  void revY() {
    yInc = -yInc;
  }
  
  //Not sure why this doesn't work....   vvv
  /*void mouseClicked(MouseEvent e) {
    if (e.getButton() == 0) {
      xInc += 5;
      yInc += 5;
    } else if (e.getButton() == 1) {
      xInc -= 5;
      yInc -= 5;
    }
  }*/
  
  void move() {
    stroke(grn,red,blu);
    ellipse(x,y,D,D);
    
    x += xInc;
    y += yInc;
    
    //Turn Around at Border
    if (x >= width - D/2 || x <= D/2) {
      revX();
    } else if (x > width + 20) {
      generate();
    }
    if (y >= height - D/2 || y <= D/2) {
      revY();
    } else if (y > height + 20) {
      generate();
    }
  }
}