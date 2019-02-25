NeuralNetwork brain;

void setup() {
  size(800, 600);
  background(42);
  
  brain = new NeuralNetwork(2, 2, 1);
  
  //float[] input = {1, 0.3};
  //float[] output = brain.feedForward(input);
  
  //for (float v : output) {
  //  println(v);
  //}
}

float[] a = {5, 2, 7, 1};
float[] b = {5, 3, 1, 6};
int counter = 0;

void draw() {
  brain.train(a, b);
}
