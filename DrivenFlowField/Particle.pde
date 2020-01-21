

class Particle {
  PVector pos = new PVector();
  private PVector initPos = new PVector();
  private PVector vel = new PVector(0, 0);
  private int lifetime;
  private int life = 0;
  
  Particle(float x, float y, int l) {
    pos.set(x, y);
    initPos.set(x, y);
    lifetime = l;
  }
  
  void update(PVector v) {
    if (lifetime != 0 && life >= lifetime) { 
      pos.set(initPos);
      vel.set(0,0);
      //print("Setting location from (" + pos.x + ", " + pos.y + ")" + " to (" + initPos.x + ", " + initPos.y + ")."); // Debug for reset jump
      life = 0;
    }
    life++;
    
    vel = v;
    pos.add(vel);
    
    if (pos.x < 0 || pos.x > width) pos.x = (pos.x < 0 ? width : 0);
    if (pos.y < 0 || pos.y > height) pos.y = (pos.y < 0 ? height : 0);
  }
}
