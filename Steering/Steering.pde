Agent a;

//Agent[] a = new Agent[500];

void setup() {
  size(800, 600);
  background(255);
  
  a = new Agent(width / 2, height / 2, -1, ShowModes.STREAK);
  
  //for (int i = 0; i < a.length; i++) {
  //  a[i] = new Agent(floor(random(width - 100) + 50), floor(random(height - 100) + 50), -1, ShowModes.STREAK);
  //  a[i].avoid = true;
  //}

}


void draw() {
  background(255);

  //for (Agent g : a) {
  //  g.addEnemy(mouseX, mouseY, 200);
  //  g.update();
  //  g.show();
  //  g.removeEnemy(mouseX, mouseY);
  //}
  
  a.update();
  a.show();
}

void mousePressed() {
  a.setTarget(mouseX, mouseY);
}


void mouseDragged() {
  a.setTarget(mouseX, mouseY);
}
