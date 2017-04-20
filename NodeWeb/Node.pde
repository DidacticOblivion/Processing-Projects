class Node {
  
  public PVector pos = new PVector();
  float r = 7;
  
  Node(float x, float y) {
    pos.x = x;
    pos.y = y;
  }
  
  Node() {
    pos.x = floor(random(r + 5, width - r - 5));
    pos.y = floor(random(r + 5, height - r - 5));
  }
  
  void connect(ArrayList<Node> node) {
    ArrayList<Node> node2 = node;
    stroke(200);
    fill(100,150,255);
    
    for (Node n : node) {
      for (Node n2 : node2) {
        if (n != n2 && n != this && n2 != this) {
          //Check occlusion and range
          if ((pos.y - n.pos.y) / (pos.x - n.pos.x) != (pos.y - n2.pos.y) / (pos.x - n2.pos.x)) {
            if (dist(pos.x, pos.y, n.pos.x, n.pos.y) <= 200) {
              line(pos.x, pos.y, n.pos.x, n.pos.y);
            }
          }
        }
      }
    }
  }
  
  void show() {
    stroke(200);
    fill(100,150,255);
    ellipse(pos.x, pos.y, 2 * r, 2 * r);
  }
  
  void fixOverlap(ArrayList<Node> node) {
    for (Node n : node) {
      if (n != this) {
        if (dist(pos.x, pos.y, n.pos.x, n.pos.y) <= 2 * (r + 2)) {
          pos.x = floor(random(r + 5, width - r - 5));
          pos.y = floor(random(r + 5, height - r - 5));
          fixOverlap(node);
          break;
        }
      }
    }
  }
  
}