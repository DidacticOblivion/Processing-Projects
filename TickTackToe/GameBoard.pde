class GameBoard {
  
  PVector gSize = new PVector(1,1);
  PVector max = new PVector(800,600);
  
  void display() {
    stroke(0);
    strokeWeight(3);
    line(width/3, 0, width/3, height);
  }
  
  void update() {
    if (gSize.x < max.x) {
      gSize.lerp(max, 0.2);
    } else {
      //display();
      background(255);
      stroke(0);
      strokeWeight(3);
      line(width/3, 0, width/3, height);
    }
  }
  
  void show() {
    noStroke();
    fill(255);
    rect(width/2 - gSize.x/2, height/2 - gSize.y/2, gSize.x, gSize.y);
  }
}