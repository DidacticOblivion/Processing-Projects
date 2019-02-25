int scl = 20;
int fFactor = 2;

FObject[] objs = new FObject[10];

float start = 0;
float vel = 0.5;
float nScl = 0.005;

boolean shouldFill = false;
boolean shouldTrace = true;

float maxCellVal = -1;

void setup() {
  size(1100, 700);
  
  for (int i = 0; i < objs.length; i++) {
    objs[i] = new FObject();
  }
}


ArrayList<FObject> objectInRange(int x, int y, float r) {
  ArrayList<FObject> solution = new ArrayList<FObject>();
  for (FObject obj : objs) {
    if (dist(x, y, obj.pos.x, obj.pos.y) <= r) {
      solution.add(obj);
    }
  }
  return solution;
}


void draw() {
  background(255);
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (y % scl == 0 && x % scl == 0) {
        float cellVal = noise(x * nScl, y * nScl, start * nScl);
        float scaledVal = map(cellVal, 0, maxCellVal, 0, 1);
        
        for (FObject obj : objectInRange(x, y, 10)) {
          obj.applyForce(0.001 * pow(dist(x, y, obj.pos.x, obj.pos.y), 2), scaledVal * TWO_PI);
        }
        
        if (shouldFill) {
          noStroke();
          fill(scaledVal * 255);
          rect(x, y, scl, scl);
        }
        
        if (shouldTrace) {
          stroke(42);
          strokeWeight(2);
          line(
            x + scl / 2, 
            y + scl / 2, 
            (x + scl / 2) + (scl * cos(scaledVal * TWO_PI) / 2), 
            (y + scl / 2) + (scl * sin(scaledVal * TWO_PI) / 2)
          );
        }
        
        if (cellVal > maxCellVal) {
          maxCellVal = cellVal;
          println(maxCellVal);        }
      }
    }
  }
  
  noStroke();
  fill(42);
  for (FObject obj : objs) {
    obj.update();
    ellipse(obj.pos.x, obj.pos.y, scl/2, scl/2);
  }
  start += vel;
}

int t = 0;

void keyPressed() {
  if (key == ' ') {
    switch (t) {
      case 0:
        shouldFill = !shouldFill;
        t = 1;
        break;
      case 1:
        shouldTrace = !shouldTrace;
        t = 0;
        break;
      default:
        break;
    }
    println("Fill: " + shouldFill + "   Trace: " + shouldTrace);
  }
}
