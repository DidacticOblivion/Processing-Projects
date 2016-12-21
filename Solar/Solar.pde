enum Classes {O, B, A, F, G, K, M} 

Star sol = new Star();

void setup() {
  size(1000,900); 
  sol.generate();
}

void mousePressed() {
  sol = new Star();
  sol.generate();
}

void draw() {
  background(0);
  translate(floor(width/2),floor(height/2));
  sol.show();
}