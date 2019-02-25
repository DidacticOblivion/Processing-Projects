float sigmoid(float x) {
  return 1 / (float)(1 + Math.exp(-x));
}

class NeuralNetwork {
  int inputNodes, hiddenNodes, outputNodes;
  Matrix weights_ih, weights_ho, bias_h, bias_o;
  float learningRate = 0.01;
  
  NeuralNetwork(int numIn, int numHid, int numOut) {
    inputNodes = numIn;
    hiddenNodes = numHid;
    outputNodes = numOut;
    
    weights_ih = new Matrix(hiddenNodes, inputNodes);
    weights_ih.randomize(-1, 1);
    weights_ho = new Matrix(outputNodes, hiddenNodes);
    weights_ho.randomize(-1, 1);
    
    bias_h = new Matrix(hiddenNodes, 1);
    bias_h.randomize(-1, 1);
    bias_o = new Matrix(outputNodes, 1);
    bias_o.randomize(-1, 1);
  }
  
  public float[] feedForward(float[] inputs) {
    Matrix input = Matrix.fromArray(inputs);
    
    Matrix hidden = Matrix.mult(weights_ih, input);
    hidden.add(bias_h);
    
    for (float[] r : hidden.data) {
      for (float v : r) {
        v = sigmoid(v);
      }
    }
    
    Matrix output = Matrix.mult(weights_ho, hidden);
    output.add(bias_o);
    
    for (float[] r : output.data) {
      for (float v : r) {
        v = sigmoid(v);
      }
    }
    
    return output.toArray();
  }
  
  public void train(float[] input, float[] target) {
    Matrix guesses = Matrix.fromArray(feedForward(input));
    Matrix targets = Matrix.fromArray(target);
    Matrix errors = targets.sub(guesses);
    
    // I don't think this is going to work at all.  New idea.....
  }
}
