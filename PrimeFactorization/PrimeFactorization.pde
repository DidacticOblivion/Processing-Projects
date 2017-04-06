ArrayList<Integer> factors = new ArrayList<Integer>();

int number = 17;//floor(random(-1000000, 1000000) + 0.5);

void setup() {
  println("The factors of " + number + " are:");
  println(factor(number));
  
  //ArrayList<Integer> numPri = howManyPrimes(0, 10000);
  //for (Integer i : numPri) {
  //  println(i);
  //}
  //println("There are " + numPri.size() + " prime numbers in this range.");
}

//Factoring Method
ArrayList<Integer> factor(int n) {
  ArrayList<Integer> f = new ArrayList<Integer>();
  float a;
  int factor = 2;
  
  //Rule out 0 or 1
  if (n != 0 && n != 1) {
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
  }
  f.add(n);
  return order(f);
}

//Method for ordering factors from least to greatest
ArrayList<Integer> order(ArrayList<Integer> f) {
  ArrayList<Integer> r = new ArrayList<Integer>();
  while (f.size() > 0) {
    Integer least = f.get(0);
    for (Integer factor : f) {
      if (factor <= least) {
        least = factor;
      }
    }
    f.remove(least);
    r.add(least);
  }
  
  return r;
}

//Method for finding all prime numbers in a range
ArrayList<Integer> howManyPrimes(int start, int end) {
  ArrayList<Integer> primes = new ArrayList<Integer>();
  
  for (int i = start; i <= end; i++) {
    ArrayList<Integer> list = factor(i);
    if (list.size() == 1) {
      if (list.get(0) != 1 && list.get(0) != 0) {
        primes.add(list.get(0));
      }
    }
  }
  
  return primes;
}