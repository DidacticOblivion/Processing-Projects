public class Node {
  
  color clr;
  public float radius;
  
  public Node (Poles pole, float _radius) {
    if (pole == Poles.POS) {
      clr = color(225,10,10);
    } else {
      clr = color(10,10,225);
    }
    
    radius = _radius;
  }
  
}