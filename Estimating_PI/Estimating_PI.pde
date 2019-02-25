ArrayList<Point> points = new ArrayList<Point>();

void setup() {
  size(600, 600);
  
  fill(200);
  stroke(0);
  strokeWeight(4);
  rect(0, 0, width, height);
  ellipse(width / 2, height / 2, width, height);
}

void draw() {
  for (int i  = 0; i < 5; i++) {
    points.add(new Point());
  }
  
  double cPoints = 0;
  
  stroke(100);
  strokeWeight(4);
  for (int i = 0; i < points.size(); i++) {
    if (dist(points.get(i).pos.x, points.get(i).pos.y, width / 2, height / 2) <= width / 2) {
      cPoints++;
    }
    point(points.get(i).pos.x, points.get(i).pos.y);
  }
  
  double my_pi = 4 * cPoints / points.size();
  println(my_pi);
}