
ArrayList<Float> data = new ArrayList<Float>();

float val = 1;

void setup() {
  data.add(sine(val));
  println(sine(val));
  size(1000, 700);
  background(255);
}


void draw() {
  background(255);
  translate(width/ 2, height / 2);
  
  stroke(0);
  fill(0);
  strokeWeight(10);
  
  for (float p : data) {
    point(floor(20 * data.indexOf(p) + 0.5), 10 * floor(p + 0.5));
  }
}


float sine(float x) {
  float hold = 0;
  
  for (int k = 0; k < 80; k++) {
    
    int a = (int)pow(-1, k);
    int b = (2 * k) + 1;
    float c = pow(x, b);
    
    println(hold);
    hold += (a / fac(b)) * c;
    
  }
  
  return hold;
}


float fac(int in) {
  if (in <= 1) {
    return 1;
  } else {
    return in * fac(in - 1);
  }
}