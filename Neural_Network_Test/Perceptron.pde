int sign(float n) {
  return (n >= 0 ? 1 : -1);
}

class Perceptron {
  float[] weights;
  double lr = 0.005;
  
  Perceptron(int w) {
    weights = new float[w];
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1, 1);
    }
  }
  
  
  int guess(float[] inputs) {
    float sum = 0;
    
    for (int i = 0; i < inputs.length; i++) {
      sum += inputs[i] * weights[i];
    }
    
    return sign(sum);
  }
  
  void train(float[] inputs, int target) {
    int guess = guess(inputs);
    int error = target - guess;
    
    for (int i = 0; i < weights.length; i++) {
      weights[i] += error * inputs[i] * lr;
    }
  }
  
  float guessB(float x) {
    return -(weights[0] / weights[1] * x) - (weights[2] / weights[1]);
  }
  
}
