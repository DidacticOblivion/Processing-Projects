PID altCtrl = new PID(1, 0, 0.01);
PID spdCtrl = new PID(0.01, 0, 0.1);

Rocket v;

boolean hoverMode = true;
int targetAlt = 100;

void setup() {
  size(300, 750);
  background(255);
  v = new Rocket(width / 2, height / 2, 7, 50);
}

void draw() {
  background(255);
  //PID
  if (hoverMode) {
    v.throttle += altCtrl.correction(height - v.pos.y, targetAlt) 
                + spdCtrl.correction(v.vel.y, 10);
  }
  //Rocket
  v.update();
  //UI
  noStroke();
  fill(200, 100, 0);
  rect(5, height - 5, 10, -200 * v.throttle);
  noFill();
  stroke(0);
  rect(3, height - 4, 13, -203);
  rect(-1, height - 215, 40, 216);
  fill(0);
  textSize(15);
  text("T\nH\nR\nO\nT\nT\nL\nE", 20, height - 185);
  text("ALT:", 4, height - 250);
  text(floor(height - v.pos.y + 0.5), 5, height - 230);
  if (hoverMode) {
    stroke(255);
    text("Target: " + targetAlt, width / 2 - 45, 35);
  }
}


void keyPressed() {
  switch (keyCode) {
    case UP:
      if (hoverMode) {
        targetAlt += 1;
      } else {
        v.throttle += 0.1;
      }
      break;
    case DOWN:
      if (hoverMode) {
        targetAlt -= 1;
      } else {
        v.throttle -= 0.1;
      }
      break;
    case LEFT:
      if (hoverMode) {
        targetAlt -= 10;
      } else {
        v.throttle = 0;
      }
      break;
    case RIGHT:
      if (hoverMode) {
        targetAlt += 10;
      } else {
        v.throttle = 1;
      }
      break;
    case ' ':
      if (!hoverMode) targetAlt = floor(height - v.pos.y + 0.5);
      hoverMode = !hoverMode;
      break;
    default:
      break;
  }
}






class Rocket extends Vehicle {
  int vw = 20;
  int vh = 100;
  
  float maxThrust = 1;
  float throttle = 0;
  
  Rocket(float x, float y) {
    pos.set(x, y);
  }
  
  Rocket(float x, float y, float mt, float m) {
    pos.set(x, y);
    maxThrust = mt;
    mass = m;
  }
  
  void applyForce(float throt) {
    float f = maxThrust * throt;
    super.applyForce(f);
  }
  
  void update() {
    stroke(0);
    fill(0);
    rect(pos.x - vw/2, pos.y - vh, vw, vh);
    beginShape();
    vertex(pos.x - vw/2, pos.y - vh);
    vertex(pos.x + vw/2, pos.y - vh);
    vertex(pos.x, pos.y - vh*1.2);
    endShape(CLOSE);
    
    if (throttle > 0) {
      noStroke();
      fill(200, 100 + random(-30, 30), 20);
      beginShape();
      vertex(pos.x - vw/4, pos.y);
      vertex(pos.x + vw/3, pos.y);
      vertex(pos.x + vw, pos.y + vh/2);
      vertex(pos.x, pos.y + 1.5*vh);
      vertex(pos.x - vw, pos.y + vh/2);
      endShape(CLOSE);
    }
    
    if (throttle < 0 || throttle > 1) {
      throttle = (throttle < 0 ? 0 : 1);
    }
    
    applyForce(throttle);
    
    super.update();
  }
}
