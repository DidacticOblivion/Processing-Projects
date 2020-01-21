import java.lang.*;

float a = 0;
float b = 1;
int   n = 10;

void setup() {
  println("Interval from " + String.format("%.6f", a) + " to " + String.format("%.6f", b) + " with " + n + " sub-intervals.");
  
  double dt = Math.floor((b-a)/n * 1000000 + 0.5) / 1000000;
  println("Sub-interval width: " + dt + "\n");
  
  double lhs = 0;
  for (double i = a; Math.floor(i * 1000000 + 0.5) / 1000000 < b; i += dt) {
    lhs += f(Math.floor(i * 1000000 + 0.5) / 1000000) * dt;
  }
  
  double rhs = 0;
  for (double i = a + dt; Math.floor(i * 1000000 + 0.5) / 1000000 <= b; i += dt) { 
    rhs += f(Math.floor(i * 1000000 + 0.5) / 1000000) * dt;
  }
  
  double trap = (lhs + rhs) / 2;
  
  double mid = 0;
  for (double i = a + dt/2; Math.floor(i * 1000000 + 0.5) / 1000000 < b; i += dt) {
    mid += f(Math.floor(i * 1000000 + 0.5) / 1000000) * dt;
  }
  
  double simp = ((2.0 * mid) + trap) / 3.0;
  
  println(" LHS: " + String.format("%c", '\t') + String.format("%.6f",lhs));
  println(" RHS: " + String.format("%c", '\t') + String.format("%.6f",rhs));
  println("TRAP: " + String.format("%c", '\t') + String.format("%.6f",trap));
  println(" MID: " + String.format("%c", '\t') + String.format("%.6f",mid));
  println("SIMP: " + String.format("%c", '\t') + String.format("%.6f",simp));
}

double f(double x) {
  return 7.0 * Math.pow(x, 6);
}
