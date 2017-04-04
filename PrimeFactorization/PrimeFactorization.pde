ArrayList<Integer> factors = new ArrayList<Integer>();

int number = floor(random(-1000000, 1000000) + 0.5);

void setup() {
  println("The factors of " + number + " are:");
  println(factor(number));
}

//Factoring Method
ArrayList<Integer> factor(int n) {
  ArrayList<Integer> f = new ArrayList<Integer>();
  float a;
  int factor = 2;
  
  //Check to see if n is negative
  if (n < 0) {
    n *= -1;
    f.add(-1);
  }
  while (n > 2) {
    //See if n is prime or not
    if (factor < n) {
      a = n / factor;
      //See if factor is really a factor of n
      if (n % factor == 0) {
        //Save factor as a factor of n and reset
        f.add(factor);
        n = (int)a; // <-- can cast [a] to int because [a] will always be an integer at this point
        factor = 1;
      }
    } else {
      break;
    }
    factor++;
  }
  
  f.add(n);
  return f;
}

//Method for ordering factors from least to greatest
ArrayList<Integer> order(ArrayList<Integer> f) {
  ArrayList<Integer> r = new ArrayList<Integer>();
  int least = -1;
  
  return r;
}