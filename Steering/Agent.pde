enum ShowModes {
  POINT, STREAK, SHAPE
}

class Agent {
  //Draw mode
  ShowModes showMode = ShowModes.POINT;

  //PD Controller
  PVector tar = new PVector();
  PVector err = new PVector();
  PVector lrr = new PVector();

  //Motion
  PVector pos = new PVector();
  PVector lps = new PVector();
  PVector vel = new PVector();

  boolean avoid = false;
  ArrayList<PVector> avoidList = new ArrayList<PVector>();

  //Constants
  float chaseRate = 0.1;
  float fleeRate = 1;
  float maxSpeed = 10;

  //Drawing
  int stroke = 42;
  float strokeWeight = 10;
  PGraphics shape;

  //Constructor
  Agent(int x, int y) {
    pos.set(x, y);
    lps.set(x, y);
    tar.set(x, y);
  }

  Agent(int x, int y, float m, ShowModes mode) {
    pos.set(x, y);
    lps.set(x, y);
    tar.set(x, y);
    maxSpeed = m;
    showMode = mode;
  }

  //Change target coords
  void setTarget(int x, int y) {
    tar.set(x, y);
  }

  //Manipulate avoid location/range
  void addEnemy(PVector v, int r) {
    avoidList.add(new PVector(v.x, v.y, r));
  }

  void addEnemy(int x, int y, int r) {
    avoidList.add(new PVector(x, y, r));
  }

  void removeEnemy(PVector v) {
    for (int i = avoidList.size() - 1; i >= 0; i--) {
      if (avoidList.get(i) == v) avoidList.remove(avoidList.get(i));
    }
  }

  void removeEnemy(int x, int y) {
    for (int i = avoidList.size() - 1; i >= 0; i--) {
      if (avoidList.get(i).x == x && avoidList.get(i).y == y) avoidList.remove(i);
    }
  }

  //Draw methods
  void update() {
    //Steer towards target
    err.set(tar.x - pos.x, tar.y - pos.y);
    vel.set(err.x * chaseRate, err.y * chaseRate);

    //Avoid enemy
    for (PVector v : avoidList) {
      float r = dist(pos.x, pos.y, v.x, v.y);
      if (r <= v.z) {
        //println("Too close!");
        err.set(pos.x - v.x, pos.y - v.y);
        vel.add(err.x * fleeRate * (v.z / (r * r)), err.y * fleeRate * (v.z / (r * r)));
      }
    }

    if (maxSpeed > 0) {
      if (vel.mag() > maxSpeed) vel.setMag(maxSpeed);
    }

    lps.set(pos);
    pos.add(vel);
  }

  void show() {
    stroke(stroke);
    strokeWeight(strokeWeight);
    switch (showMode) {
    case POINT:
      point(pos.x, pos.y);
      break;
    case STREAK:
      line(pos.x, pos.y, lps.x, lps.y);
      break;
    case SHAPE:
      //shape.rotate(vel.heading());
      image(shape, pos.x, pos.y);
      break;
    default:
      showMode = ShowModes.POINT;
      break;
    }
  }
}