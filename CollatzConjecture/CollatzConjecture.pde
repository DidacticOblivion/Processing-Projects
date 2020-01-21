import processing.pdf.*;

void setup() {
  size(1200, 800);
  beginRecord(PDF, "Collatz.pdf");
  background(0);
  stroke(255, 25);
  strokeWeight(2);
  noFill();
}


void draw() {
  for (int i = 1; i <= 10000; i++) {
    IntList sequence = new IntList();
    int n = i;
    do {
      sequence.append(n);
      n = collatz(n);
    } while (n != 1);
    sequence.append(1);
    sequence.reverse();
    
    float angle = 0.15;
    float len = 8;
    resetMatrix();
    translate(width / 2, height);
    for (int j = 0; j < sequence.size(); j++) {
      int val = sequence.get(j);
        if (val % 2 == 0) {
          rotate(-angle);
        } else {
          rotate(angle);
        }
        line(0, 0, 0, -len);
        translate(0, -len);
    }
  }
  endRecord();
  noLoop();
}


int collatz(int n) {
  if (n % 2 == 0) { //Even
    return n / 2;
  } else {          //Odd
    return (3 * n + 1)/2;
  }
}
