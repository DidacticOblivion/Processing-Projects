public class Node {
  
  RGBVector clr;
  public float radius;
  
  public Node (Poles pole, float _radius) {
    if (pole == Poles.POS) {
      clr.r = 225;
      clr.g = 10;
      clr.b = 10;
    } else {
      clr.r = 10;
      clr.g = 10;
      clr.b = 225;
    }
    
    radius = _radius;
  }
  
}