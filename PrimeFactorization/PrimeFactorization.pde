ArrayList<Integer> factors = new ArrayList<Integer>();

int number = 953589732;

void setup() {
  println(factor(number));
}

//Factoring Method
ArrayList<Integer> factor(int n) {
  ArrayList<Integer> f = new ArrayList<Integer>();
  float a;
  int factor = 2;
  
  while (n > 2) {
    //See if n is prime or not
    if (factor < n) {
      a = n / factor;
      //See if factor is really a factor of n
      if (n % factor == 0) {
        //Save factor as a factor of n and reset
        f.add(factor);
        n = (int)a; // <-- can cast [a] to int because [a] will always be an integer at this point
        factor = 2;
      }
    } else {
      break;
    }
    factor++;
  }
  
  f.add(n);
  return f;
}