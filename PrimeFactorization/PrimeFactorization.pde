ArrayList<Integer> factors = new ArrayList<Integer>();

int number = floor(random(-1000000, 1000000) + 0.5);

void setup() {
  //println("The factors of " + number + " are:");
  //println(group(factor(number)));
  size(800,200);
  display();
  //println(howManyPrimes(0,2000));
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
      //Identifying the least factor
      if (factor <= least) {
        least = factor;
      }
    }
    //Remove least factor to search for next least
    f.remove(least);
    r.add(least);
  }
  
  return r;
}

//Method for grouping factors with exponents
ArrayList<String> group(ArrayList<Integer> f) {
  ArrayList<String> r = new ArrayList<String>();
  ArrayList<Integer> c = f;
  ArrayList<Integer> col = new ArrayList<Integer>();
  int ex = 0;
  
  //Loop through all factors in ArrayList and check against every factor in same Array List
  for (Integer fact : f) {
    for (Integer cfact : c) {
      //Everytime the factor being searched for shows up, add 1 to exponent
      if (cfact == fact) {
        ex++;
      }
    }
    //If the group of factors has not been identified yet, add it
    if (!col.contains(fact)) {
      //Don't display 1 as a prime factor
      if (fact != 1) {
        //Only show exponent for greater-than-one exponents to reduce spam in output
        if (ex > 1) {
          r.add(fact + "^" + ex);
        } else {
          r.add(String.valueOf(fact));
        }
      } else {
        r.add("One is a unit.");
      }
      //Keep track of groups of factors that have been added
      col.add(fact);
    }
    ex = 0;
  }
  
  return r;
}

//Method for finding all prime numbers in a specified range
ArrayList<Integer> howManyPrimes(int start, int end) {
  ArrayList<Integer> primes = new ArrayList<Integer>();
  
  for (int i = start; i <= end; i++) {
    ArrayList<Integer> list = factor(i);
    
    //If there is only one factor, it's prime
    if (list.size() == 1) {
      //Don't count 1 or 0 (not prime or composite)
      if (list.get(0) != 1 && list.get(0) != 0) {
        primes.add(list.get(0));
      }
    }
  }
  
  return primes;
}

//Cut and paste method to clean up setup()
void display() {
  background(42);
  fill(255);
  textSize(40);
  textAlign(CENTER,TOP);
  
  ArrayList<String> t = group(factor(number));
  String txt = "";
  for (String s : t) {
    txt += s;
    if (t.indexOf(s) < t.size() - 1) {
      txt += ", ";
    }
  }
  text("The prime factors of " + number + " are:", 0, height / 2 - 70, width, height / 2);
  text(txt, 0, height / 2, width, height);
}