Button b;

void setup() {
  size(500, 500);
  background(42);
  b = new Button(floor(width/2) , floor(height/2), 200, 50);
  b.textScale = 20;
}

int counter = 0;

void draw() {
  
  if (b.pressedOnce) {
    println(counter);
    counter++;
  }
  if (counter > 0) {
    b.text = String.valueOf(counter);
  }
  
  b.show();
}