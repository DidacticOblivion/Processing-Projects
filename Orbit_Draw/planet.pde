class Planet {
  
  Orbit orbit;
  
  public Planet(Orbit _orbit) {
    orbit = _orbit;
  }
  
  public Planet(float _x, float _a, float _b, float _h, float _k, float _mu) {
    orbit = new Orbit(_x, _a, _b, _h, _k, _mu);
  }
  
  public Planet(float _x, float _a, float _b, float _mu) {
    orbit = new Orbit(_x, _a, _b, _mu);
  }
}