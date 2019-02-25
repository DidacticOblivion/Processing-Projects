/*
  Document containing Matrix library/API and included exceptions
 -Create a Matrix object and manipulate it with
 mathematical functions common to linear algebra.
 
 =-Created on 08/18/18 by Cole Smith-=
 
 =-Originally designed for my neural network-=
 */

public static class Matrix {
  public int rows;
  public int cols;
  public float[][] data;


  //Constructor
  Matrix(int r, int c) {
    rows = r;
    cols = c;

    data = new float[r][c];

    for (int i = 0; i < r; i++) {
      for (int j = 0; j < c; j++) {
        data[i][j] = 0f;
      }
    }
  }

  Matrix(float[][] r) {
    rows = r.length;
    cols = r[0].length;
    data = new float[rows][cols];
    
    int lastLength = r[0].length;
    for (int i = 0; i < r.length; i++) {
      if (r[i].length != lastLength) {
        System.err.println("[Matrix Constructor] New Matrix opperation failed: All rows must be the same length.");
        return;
      }
      data[i] = r[i];
      lastLength = r[i].length;
    }
  }
  
  //Merge two matrices
  public Matrix join(Matrix input) {
    if (cols != input.cols) throw(new MismatchedMatrixDimensionsException());
    
    Matrix result = new Matrix(rows + input.rows, cols);
    
    for (int i = 0; i < result.cols; i++) {
      result.data[i] = (i < cols ? data[i] : input.data[i - cols - 1]);
    }
    
    return result;
  }
  
  //Static Merge two Matrices
  public static Matrix join(Matrix target, Matrix input) {
    if (target.cols != input.cols) throw(new MismatchedMatrixDimensionsException());
    
    Matrix result = new Matrix(target.rows + input.rows, target.cols);
    
    for (int i = 0; i < result.cols; i++) {
      result.data[i] = (i < target.cols ? target.data[i] : input.data[i - target.cols - 1]);
    }
    
    return result;
  }
  
  //Print out matrix
  public void printOut() {
    for (float[] r : data) {
      for (float v : r) {
          System.out.print((v >= 0 ? " " : "") + v + "   ");
      }
      System.out.print("\n");
    }
  }
  
  //Static Print out matrix
  public static void printOut(Matrix target) {
    for (float[] r : target.data) {
      for (float v : r) {
          System.out.print((v >= 0 ? " " : "") + v + "   ");
      }
      System.out.print("\n");
    }
  }
  
  //Print out matrix with decimal roundoff
  public void printOut(int n) {
    for (float[] r : data) {
      for (float v : r) {
        System.out.print((v >= 0 ? " " : "") + Math.floor(v * n + 0.5) / n + "   ");
      }
      System.out.print("\n");
    }
  }
  
  //Static Print out matrix with decimal roundoff
  public static void printOut(Matrix target, int n) {
    for (float[] r : target.data) {
      for (float v : r) {
        System.out.print((v >= 0 ? " " : "") + Math.floor(v * n + 0.5) / n + "   ");
      }
      System.out.print("\n");
    }
  }

  //Scalar Multiplication
  public Matrix mult(float scalar) {
    Matrix result = new Matrix(rows, cols);
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.data[i][j] *= scalar;
      }
    }
    return result;
  }
  
  //Static Scalar Multiplication
  public static Matrix mult(Matrix target, float scalar) {
    for (int i = 0; i < target.rows; i++) {
      for (int j = 0; j < target.cols; j++) {
        target.data[i][j] *= scalar;
      }
    }
    return target;
  }
  
  //Dot Product Multiplication
  public Matrix mult(Matrix input) {
    if (cols != input.rows) throw(new MismatchedMatrixDimensionsException());

    Matrix product = new Matrix(rows, input.cols);


    for (int i = 0; i < product.rows; i++) {   // Which row of product to solve for
      for (int j = 0; j < product.cols; j++) { // Which column of product to solve for
        float sum = 0;
        for (int k = 0; k < cols; k++) {// Which element should be multiplied
          sum += data[i][k] * input.data[k][j];
        }
        product.data[i][j] = sum;
      }
    }
    return product;
  }

  //Static Dot Product Multiplication
  public static Matrix mult(Matrix target, Matrix input) {
    if (target.cols != input.rows) throw(new MismatchedMatrixDimensionsException());

    Matrix product = new Matrix(target.rows, input.cols);


    for (int i = 0; i < product.rows; i++) {   // Which row of product to solve for
      for (int j = 0; j < product.cols; j++) { // Which column of product to solve for
        float sum = 0;
        for (int k = 0; k < target.cols; k++) {// Which element should be multiplied
          sum += target.data[i][k] * input.data[k][j];
        }
        product.data[i][j] = sum;
      }
    }

    return product;
  }

  //Hadamard Multiplication
  public Matrix hMult(Matrix inputs) {
    if (rows != inputs.rows || cols != inputs.cols) throw(new MismatchedMatrixDimensionsException());
    
    Matrix result = new Matrix(rows, cols);
    
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.data[i][j] *= inputs.data[i][j];
      }
    }
    return result;
  }
  
  //Static Hadamard Multiplication
  public static Matrix hMult(Matrix target, Matrix input) {
    if (target.rows != input.rows || target.cols != input.cols) throw(new MismatchedMatrixDimensionsException());

    for (int i = 0; i < target.rows; i++) {
      for (int j = 0; j < target.cols; j++) {
        target.data[i][j] *= input.data[i][j];
      }
    }
    return target;
  }

  //Add number to every value
  public Matrix add(float input) {
    Matrix result = new Matrix(rows, cols);
    
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.data[i][j] += input;
      }
    }
    return result;
  }
  
  //Static Add number to every value
  public static Matrix add(Matrix target, float input) {
    for (int i = 0; i < target.rows; i++) {
      for (int j = 0; j < target.cols; j++) {
        target.data[i][j] += input;
      }
    }
    return target;
  }

  //Add matrices Element-Wise
  public Matrix add(Matrix inputs) {
    if (rows != inputs.rows || cols != inputs.cols) throw(new MismatchedMatrixDimensionsException());

    Matrix result = new Matrix(rows, cols);

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.data[i][j] += inputs.data[i][j];
      }
    }
    return result;
  }
  
  //Static Add matrices Element-Wise
  public static Matrix add(Matrix target, Matrix input) {
    if (target.rows != input.rows || target.cols != input.cols) throw(new MismatchedMatrixDimensionsException());

    for (int i = 0; i < target.rows; i++) {
      for (int j = 0; j < target.cols; j++) {
        target.data[i][j] += input.data[i][j];
      }
    }
    return target;
  }
  
  //Subtract number from every value
  public Matrix sub(float input) {
    Matrix result = new Matrix(rows, cols);
    
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.data[i][j] -= input;
      }
    }
    return result;
  }
  
  //Static Subtract number from every value
  public static Matrix sub(Matrix target, float input) {
    for (int i = 0; i < target.rows; i++) {
      for (int j = 0; j < target.cols; j++) {
        target.data[i][j] -= input;
      }
    }
    return target;
  }
  
  //Subtract matrices Element-Wise
  public Matrix sub(Matrix input) {
    if (rows != input.rows || cols != input.cols) throw(new MismatchedMatrixDimensionsException());
    
    Matrix result = new Matrix(rows, cols);
    
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.data[i][j] -= input.data[i][j];
      }
    }
    return result;
  }
  
  //Static Subtract matrices Element-Wise
  public static Matrix sub(Matrix target, Matrix input) {
    if (target.rows != input.rows || target.cols != input.cols) throw(new MismatchedMatrixDimensionsException());

    for (int i = 0; i < target.rows; i++) {
      for (int j = 0; j < target.cols; j++) {
        target.data[i][j] -= input.data[i][j];
      }
    }
    return target;
  }

  //Randomize the values of the matrix this method is called on between two values
  public void randomize(float low, float high) {
    float range = high - low;

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        data[i][j] = (float)Math.random() * range + low;
      }
    }
  }
  
  //Static Randomize the values of a matrix passed into this method between two numbers
  public static Matrix randomize(Matrix input, float low, float high) {
    float range = high - low;

    for (int i = 0; i < input.rows; i++) {
      for (int j = 0; j < input.cols; j++) {
        input.data[i][j] = (float)Math.random() * range + low;
      }
    }
    return input;
  }
  
  //Transpose a matrix's columns and rows
  public void transpose() {
    Matrix result = new Matrix(cols, rows);
    
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.data[j][i] = data[i][j];
      }
    }
    rows = result.rows;
    cols = result.cols;
    data = result.data;
  }
  
  //Static Transpose a matrix's columns and rows
  public static Matrix transpose(Matrix input) {
    Matrix result = new Matrix(input.cols, input.rows);
    
    for (int i = 0; i < input.rows; i++) {
      for (int j = 0; j < input.cols; j++) {
        result.data[j][i] = input.data[i][j];
      }
    }
    
    return result;
  }
  
  //Create n x 1 dimensional matrix from an array
  public static Matrix fromArray(float[] inputs) {
    Matrix result = new Matrix(inputs.length, 1);
    
    for (int i = 0; i < inputs.length; i++) {
      result.data[i][0] = inputs[i];
    }
    
    return result;
  }
  
  //Create an array from an n x 1 dimensional matrix
  public float[] toArray() {
    if (cols > 1) throw(new MismatchedMatrixDimensionsException());
    
    float[] result = new float[rows];
    for (int i = 0; i < rows; i++) {
      result[i] = data[i][0];
    }
    
    return result;
  }
  
  //Static Create an array from an n x 1 dimensional matrix
  public static float[] toArray(Matrix input) {
    if (input.cols > 1) throw(new MismatchedMatrixDimensionsException());
    
    float[] result = new float[input.rows];
    for (int i = 0; i < input.rows; i++) {
      result[i] = input.data[i][0];
    }
    
    return result;
  }
}




// Exceptions ---------------------------------------------------------------

/*
  MismatchedMatrixDimensionsException is called when matrices are required to
 have corresponding dimensions of the same size in an opperation but do not.
 */
public static final class MismatchedMatrixDimensionsException extends RuntimeException {
  public static final long serialVersionUID = 4374L;

  MismatchedMatrixDimensionsException() {
    super();
  }

  @Override
    public String getMessage() {
    return "Matrices have invalid dimensions for opperation!";
  }
}
