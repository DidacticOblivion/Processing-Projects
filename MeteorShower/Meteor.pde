class Meteor {
  int y = 0;
  int x = (int)random(50, width - 50);
  
  float startTime = random(10) + second();
  boolean go = false;
  
  public Meteor() {}
  
  public void fall() {
    if (startTime <= second() || go) {
      ellipse((int)x,(int)y,10,10);
      
      if (y >= height) {
        x = (int)random(50, width - 50);
        y = 0;
      }
      y = (int)(y * 1.1);
      y++;
      go = true;
    }
  }
}