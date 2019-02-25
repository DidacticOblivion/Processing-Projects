Matrix m;

float[] a = {1.4, 6.2, 8.2, 1.7};
float[] b = {4.5, 1.1, 7.0, 9.2};
float[] c = {2.0, 8.5, 1.0, 3.1};
float[][] d = {a, b, c};

void setup() {
  m = new Matrix(d);
  m.printOut();
}
