float e = 1;
int it = 1;

void setup() {
  size(200,200);
  background(42);
  frameRate(5);
}

void draw() {
  background(42);
  
  e += 1.0/fac(it);
  
  println(e);
  
  fill(255);
  textSize(25);
  text(e, 10, height / 2);
  
  it++;
}

int fac(int val) {
  int pro = 1;
  
  for (int i = val; i > 0; i--) {
    pro *= i;
    //print(i + (i != 1 ? " * " : " = "));
  }
  
  //println(pro);
  return pro;
}