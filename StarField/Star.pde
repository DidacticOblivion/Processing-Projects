class Star {
  float x;
  float y;
  float z;
  float red = random(200);
  float g = random(200);
  float b = random(200);
  
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
    
    if (mousePressed) {
      fill(red,g,b,255-map(r,16,0,0,200));
    } else {
      fill(255-map(r,16,0,0,200));
    }
    noStroke();
    
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    
    ellipse(sx, sy, r, r);
  }
}