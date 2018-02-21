double input = 2018;
double n = input;

double iterations = 100000;

void setup() {
  
  for (int i = 0; i < iterations; i++) {
    n = 0.5 * (n + (input / n));
  }
  
  println("The Square Root of " + input + " is:");
  println(n);
  print(sqrt((float)input));
}