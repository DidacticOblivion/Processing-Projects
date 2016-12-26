enum StarClasses {O, B, A, F, G, K, M} 
enum PlanetClasses {Minor, Rocky, Gas}
enum PlanetTypes {Planetoid, Mercurian, Subterran, Terran, Superterran, Neptunian, Jovian}

Star sol = new Star();
Planet plnt = new Planet();

PImage sun = new PImage();
float radius = 200;
float oSpeed = 5;

float oStep = 0;

PImage makeStar() {
  background(0);
  sol.generate();
  sol.show();
  saveFrame("savedImg");
  PImage returnImage = loadImage("savedImg");
  loadPixels();
  returnImage.get(-250,250,500,500);
  return returnImage;
}

void setup() {
  size(1000,700);
  sun = makeStar();
  plnt = new Planet();
  plnt.generate();
}

void mousePressed() {
  sol = new Star();
  sun = makeStar();
  plnt = new Planet();
  plnt.generate();
}

void draw() {
  image(sun,-250,250);
  translate(floor(width/2),floor(height/2));
  
  plnt.show(radius * -sin(oStep * oSpeed/100),radius * sin(oStep * oSpeed/100 + (1.5 * radius)));
  
  background(0);
  oStep++;
}