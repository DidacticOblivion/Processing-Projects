class Star {
  float x;
  float y;
  float z;
  
  Star() {
   x = random(-width/2, width/2); 
   y = random(-height/2, height/2);
   z = random(width);
  }
  
  void update() {
    z = z - speed;
    if (z < 1) {
      z = width;
      x = random(-width/2, width/2); 
      y = random(-height/2, height/2);
    }
  }
  
  void show() {
    float r = map(z, 0, width, 16, 0);
    
    fill(255-map(r,16,0,0,200),255-map(r,16,0,0,200),255-map(r,16,0,0,200));
    noStroke();
    
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    
    ellipse(sx, sy, r, r);
  }
}