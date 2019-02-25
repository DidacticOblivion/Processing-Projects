class Perceptron {
  double learningRate;
  float[] weights;

  Perceptron(int numIn, double lr) {
    weights = new float[numIn];
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1, 1);
    }

    learningRate = lr;
  }

  float guess(float[] inputs) {
    float sum = 0;
    for (int i = 0; i < inputs.length; i++) {
      sum += inputs[i] * weights[i];
    }

    // Figure out activation method
    return sigmoid(sum);
  }

  void train(float[] inputs, float target) {
    float guess = guess(inputs);
    float error = target - guess;

    for (int i = 0; i < weights.length; i++) {
      weights[i] += error * inputs[i] * learningRate;
    }
  }
}
