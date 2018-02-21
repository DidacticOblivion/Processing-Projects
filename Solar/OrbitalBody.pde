abstract class OrbitalBody {
  float radius;
  float step;

  float vel() {
    return sqrt(5 / (radius * radius));
  }

  PVector pos() {
     return new PVector(
                     (1.5 * radius * cos(step)), 
                     (1.5 * radius * sin(step))
                     );
  }
}