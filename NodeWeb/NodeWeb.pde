ArrayList<Node> nodes = new ArrayList<Node>();

void setup() {
  size(800, 600);
  background(42);
  
  scatter(20);
}


void draw() {
  for (Node n : nodes) {
    n.connect(nodes);
  }
  for (Node n : nodes) {
    n.show();
  }
}

void scatter(int num) {
  for (int i = 0; i < num; i++) {
    nodes.add(new Node());
  }
  for (Node n : nodes) {
    n.fixOverlap(nodes);
  }
}