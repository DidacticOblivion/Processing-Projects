String txt = "";

void setup() {
  //size(800, 600, P3D);
  fullScreen(P3D);
  background(0);
  
  String[] lines = loadStrings("text.txt");
  
  for (int i = 1; i < lines.length; i++) {
    txt += lines[i] + "\n";
  }
  
  //print(txt);
}

int y = 700;

void draw() {
  background(0);
  rotateX(PI/4);
  
  fill(254, 204, 12);
  noStroke();
  textAlign(CENTER);
  textSize(50);
  text("World Wars", width / 2, y - 30);
  textSize(15);
  text("Episode II", width / 2, y);
  textSize(10);
  text(txt, width / 2, y + 100);
  
  y--;
  
  saveFrame("ImageStrip/img_###.jpg");
}