class Drop {
  float x = random(width);
  float y = random(-500,-50);
  float z = random(0,20);
  float yspeed = map(z,0,20,2,5);
  float len = map(z, 0, 20, 10, 20);
  
  void fall() {
    y = y + yspeed;
    float grav = map(z,0,20,0,0.2);
    yspeed = yspeed + grav;
    
    if (y > height) {
       y = random(-500,-50);
       yspeed = map(z,0,20,2,5);
    }
  }
  
  void show() {
    float thick = map(z,0,20,1,2);
    strokeWeight(thick);
    stroke(20,100 + map(z,0,20,10,0),155);
    line(x,y,x,y+10);
    
  }
}