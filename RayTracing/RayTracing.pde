PVector[] points = new PVector[8];

void setup() {
  points[0] = new PVector(50, 50, 50);
  points[1] = new PVector(50, 50, -50);
  points[2] = new PVector(50, -50, 50);
  points[3] = new PVector(50, -50, -50);
  points[4] = new PVector(-50, 50, 50);
  points[5] = new PVector(-50, 50, -50);
  points[6] = new PVector(-50, -50, 50);
  points[7] = new PVector(-50, -50, -50);
  
  size(800, 600);
  background(0);
}


void draw() {
  background(0);
  translate(width / 2, height / 2);
  
  stroke(255);
  strokeWeight(10);
}


float[][] matmul(float[][] a, float[][] b) {
  float[][] product = new float[a.length][b[0].length];
  
  if (a[0].length == b.length) {
    for (int i = 0; i < product.length; i++) {
      for (int j = 0; j < product[0].length; j++) {
        product[i][j] = ;
      }
    }
  } else {
    System.err.print("\"matmul\": The columns of A does not equal the rows of B.");
    exit();
  }
  
  return product;
}
