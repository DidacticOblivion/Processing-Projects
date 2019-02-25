
float f(float x) {
  return 0.3 * x + 0.2;
}

class Point {

  PVector pos;
  float bias = 1;
  int label;

  Point() {
    pos = new PVector( random(-1, 1), random(-1, 1) );
    
    if (pos.y > f(pos.x)) {
      label = 1;
    } else if (pos.y < f(pos.x)) {
      label = -1;
    } else {
      label = 0;
    }
  }
  
  Point(float x, float y) {
    pos = new PVector(x, y);
  }

  PVector pCoords() {
    return new PVector(map(pos.x, -1, 1, 0, width), map(pos.y, -1, 1, height, 0));
  }

  void show() {
    noStroke();
    ellipse(pCoords().x, pCoords().y, 7, 7);
  }
}
