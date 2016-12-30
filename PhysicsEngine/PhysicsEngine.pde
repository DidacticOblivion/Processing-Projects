ArrayList<RigidBody> Objects = new ArrayList();

float gravity = 0.2;

void setup() {
  size(500,500);
  Objects.add(new RigidBody(new PVector(width/2, height/2), 5, 2));
  stroke(0);
  strokeWeight(3);
  background(200);
}

void mousePressed() {
  Objects.get(0).addForce(new PVector(mouseX - Objects.get(0).location.x, mouseY - Objects.get(0).location.y).mult(2));
}

void draw() {
  background(200,100);
  line(0,height-50,width,height-50);
  ellipse(Objects.get(0).location.x, Objects.get(0).location.y, 15, 15);
  
  if (Objects.get(0).location.y > height-60 && !mousePressed) {
    Objects.get(0).velocity.y = -Objects.get(0).velocity.y;
  } else {
    if (Objects.get(0).location.y < height-60) {
      Objects.get(0).velocity.y += gravity;
    }
  }
  if (Objects.get(0).location.x <= 0 || Objects.get(0).location.x >= width) {
    Objects.get(0).velocity.x = -Objects.get(0).velocity.x;
  }
  Objects.get(0).update();
}