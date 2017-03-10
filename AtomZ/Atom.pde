public enum Poles {POS, NEG}

public class Atom {
  
  String name;
  int size;
  color clr;
  
  private ArrayList<Poles> nodes = new ArrayList<Poles>();
  
  public Atom (String _name, int _size) {
    name = _name;
    size = _size;
    clr = color(random(0,225),random(0,225),random(0,225));
  }
  
  public Atom (String _name, int _size, color _color) {
    name = _name;
    size = _size;
    clr = _color;
  }
  
  public void AddNode(Poles _pole) {
    nodes.add(_pole);
  }
  
  public ArrayList<Poles> GetNodes() {
    return nodes;
  }
  
}