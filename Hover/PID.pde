class PID {
  float err = 0;
  float kp = 1;
  float der = 0;
  float ler = 0;
  float kd = 0;
  float ier = 0;
  float ki = 0;
  
  PID(float P, float I, float D) {
    kp = P;
    ki = I;
    kd = D;
  }
  
  float correction(float actual, float target) {
    err = target - actual;
    der = (err - ler) / frameRate;
    ier += err;
    return (err * kp) + (der * kd) + (ier * ki);
  }
}
