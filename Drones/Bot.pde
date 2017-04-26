class Bot {
  PVector pos = new PVector(width/2, height/2);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  float maxVel = 10;

  float r = 20;
  PShape sprite;
  
  //Constructors
  Bot() {
    sprite = createBotSprite();
  }
  
  Bot(PVector startPos) {
    pos = startPos;
    sprite = createBotSprite();
  }

  //Method for creating bot sprite
  PShape createBotSprite() {
    PShape botSprite = createShape();
    botSprite.beginShape();
    botSprite.stroke(130);
    botSprite.fill(100);
    botSprite.strokeWeight(2);
    botSprite.vertex(r / 2, 0);
    botSprite.vertex(r, r * 2);
    botSprite.vertex(0, r * 2);
    botSprite.endShape(CLOSE);
    return botSprite;
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void followMaxVel() {
    if (vel.mag() > maxVel) {
      vel.setMag(maxVel);
    }
    if (vel.mag() < -maxVel) {
      vel.setMag(-maxVel);
    }
  }
  
  void checkEdges(PVector min, PVector max) {
    if (pos.x < min.x || pos.x > max.x - r) {
      vel.x *= -1;
    }
    if (pos.y < min.y || pos.y > max.y - 2 * r) {
      vel.y *= -1;
    }
  }

  void update() {
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
    
    followMaxVel();
    checkEdges(new PVector(0,0), new PVector(width, height));
    
    
    shape(sprite, pos.x, pos.y);
  }
}