enum StarClasses {O, B, A, F, G, K, M} 
enum PlanetClasses {Minor, Rocky, Gas}
enum PlanetTypes {Planetoid, Mercurian, Subterran, Terran, Superterran, Neptunian, Jovian}

Star star = new Star();
Planet[] plnt = new Planet[5];

float[] radius = new float[plnt.length];
float oSpeed = 2;

float[] oStep = new float[plnt.length];

void setup() {
  size(1000,700);
  star.generate();
  for (int i = 0; i < plnt.length; i++) {
    plnt[i] = new Planet();
    plnt[i].generate();
    radius[i] = star.d + random(50,200) + plnt[i].d;
    oStep[i] = random((float)(2 * radius[i] * Math.PI));
  }
}

void mousePressed() {
  star = new Star();
  star.generate();
  for (int i = 0; i < plnt.length; i++) {
    oStep[i] = random((float)(2 * radius[i] * Math.PI));
    plnt[i] = new Planet();
    plnt[i].generate();
  }
}

void draw() {
  translate(floor(width/2),floor(height/2));
  background(0);
  
  star.show();
  
  for (int i = 0; i < plnt.length; i++) {
    plnt[i].show(); //<-- Make better orbital dynamics!!!
    oStep[i]++;
  }
}