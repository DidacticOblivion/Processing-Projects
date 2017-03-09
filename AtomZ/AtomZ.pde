Atom myAtom;
Poles[] nodes = new Poles[floor(random(1,8)+0.5)];

public void setup () {
  myAtom = new Atom("Derponium", 100, new RGBVector(50,225,100));
  
  for (Poles pole : nodes) {
    final float randVar = random(0,1);
    if (randVar > 0.5) {
      pole = Poles.POS;
    } else {
      pole = Poles.NEG;
    }
    myAtom.AddNode(pole);
  }
  
  print(myAtom.GetNodes());
  size(500,500);
}



public void draw () {
  background(65, 67, 140);
  noStroke();
  fill(myAtom.clr.r, myAtom.clr.g, myAtom.clr.b);
  ellipse(width/2, height/2, myAtom.size, myAtom.size);
}