abstract class OrbitalBody {
  PVector pos = new PVector();
  float radius;
  float step;

  float vel() {
    return sqrt(5 / (radius * radius));
  }

  float[] coordinates() {
    float[] coords = new float[2];
    coords[0] = (1.5 * radius * cos(step)); 
    coords[1] = (1.5 * radius * sin(step));

    return coords;
  }
}