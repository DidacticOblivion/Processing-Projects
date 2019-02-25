class Orbit {
  
  float step = 0;
  
  int a;
  int b;
  float mu = 0.01;
  
  PVector pCoords = new PVector(0, 0);
  PVector foc = new PVector(0, 0);
  
  
  Orbit(int x, int y, int maj, int min) {
    foc = new PVector(-sqrt(pow(a, 2) - pow(b, 2)) + x, y);
    pCoords = new PVector(x, y);
    
    a = maj;
    b = min;
  }
  
  float x(float s) {
    return (cos(s) * a) + pCoords.x;
  }
  
  float y(float s) {
    float h = b * sqrt(1 - (pow(x(s) - pCoords.x, 2) / pow(a, 2)));
    return (h * (sin(s) < 0 ? -1 : 1)) + pCoords.y;
  }
  
  float rad(float s) {
    return dist(foc.x, foc.y, x(s), y(s));
  }
  
  float vel(float s) {
    float h = (2 / rad(s)) - (1 / a);
    return sqrt(mu * h);
  }
}