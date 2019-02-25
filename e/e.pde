float e = 1;
int it = 1;

void setup() {
  frameRate(5);
}

void draw() {
  background(42);
  
  e += 1.0/fac(it);
  
  println(e);
  
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
