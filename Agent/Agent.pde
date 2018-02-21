Drone drone;


void setup() {
  size(1000, 700);
  background(255);
  
  drone = new Drone(5, 1);
}

void mousePressed() {
  drone.moveTo(mouseX - width / 2, mouseY - height / 2);
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  
  drone.update();
}