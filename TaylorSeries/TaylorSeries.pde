float inputValue = 1;
double acc = 0;

void setup() {}

int iter = 0;
void draw() {
  //println(acc + "  <->  " + sin(inputValue) + "  Dif: " + ((float)acc - sin(inputValue)));
  //println(acc + "  <->  " + cos(inputValue) + "  Dif: " + ((float)acc - cos(inputValue)));
  println("e: " + acc);

  //acc += Sine(inputValue, iter);
  //acc += Cosine(inputValue, iter);
  acc += e(inputValue, iter);
  iter++;
}


float Sine(float input, int i) {
  float power = 2 * i + 1;
  return pow(-1, i) / factorial(power) * pow(input, power);
}

float Cosine(float input, int i) {
  float power = 2 * i;
  return pow(-1, i) / factorial(power) * pow(input, power);
}

float e(float input, int i) {
  return pow(-1, i) * ((Sine(input, i) + Cosine(input, i)));
}



float factorial(float input) {
  float output = 1;
  for (int i = 1; i <= input; i++) {
    output *= i;
  }
  return output;
}
