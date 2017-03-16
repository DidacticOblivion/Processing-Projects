class Orbit {
  
  boolean top = true;
  
  float x;
  float y;
  float a;
  float b;
  float h;
  float k;
  float f;
  float mu;
  
  float i = 0;
  
  public Orbit(float _x, float _a, float _b, float _h, float _k, float _mu) {
    x = _x;
    a = _a;
    b = _b;
    h = _h;
    k = _k;
    f = sqrt(pow(a,2)-pow(b,2));
    mu = _mu;
  }
  
  public Orbit(float _x, float _a, float _b, float _mu) {
    x = _x;
    a = _a;
    b = _b;
    h = 0;
    k = 0;
    f = sqrt(pow(a,2)-pow(b,2));
    mu = _mu;
  }
  
  float radius() {
    float rad = sqrt((pow(x-a,2)+pow(y-k,2)));
    return rad;
  }
  
  public float velocity() {
    float vel = sqrt(mu * ((2/radius())-(1/a)));
    return vel;
  }
  
  public void updateOrbit() {
    x = radius() * sin(i);
    y = radius() * cos(i);
    
    i += velocity();
  }
}