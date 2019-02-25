Perceptron brain;
Point[] points = new Point[500];

void setup() {
  size(1000, 600);
  background(42);
  
  for (int i = 0; i < points.length; i++) {
    points[i] = new Point();
  }
  
  brain = new Perceptron(3);
}


int i = 0;
void draw() {
  background(42);
  
  // Line
  stroke(150);
  strokeWeight(2);
  
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  line(p1.pCoords().x, p1.pCoords().y, p2.pCoords().x, p2.pCoords().y);
  
  stroke(200);
  Point p3 = new Point(-1, brain.guessB(-1));
  Point p4 = new Point(1, brain.guessB(1));
  line(p3.pCoords().x, p3.pCoords().y, p4.pCoords().x, p4.pCoords().y);
  
  // Training perceptron
  float[] inputs = { points[i].pos.x, points[i].pos.y, points[i].bias };
  int target = points[i].label;
  brain.train(inputs, target);
  
  // Drawing correct/incorrect points different colors
  for (Point p : points) {
    float[] in = { p.pos.x, p.pos.y, p.bias };
    int g = brain.guess(in);
    int t = p.label;
    
    if (g == t) {
      fill(50, 255, 100);
    } else {
      fill(255, 50, 50);
    }
    
    if (t == 0) {
      fill(20, 100, 255);
    }
    
    p.show();
  }
  
  i = (i < points.length - 1 ? i + 1 : 0);
}
