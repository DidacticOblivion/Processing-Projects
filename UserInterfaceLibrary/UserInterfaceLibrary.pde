UITextField tf;
void setup() {
  size(600, 400);
  background(42);
  tf = new UITextField(100, 100);
}

void draw(){
  background(42);
  tf.update();
  tf.mouseButtonCheck();
}