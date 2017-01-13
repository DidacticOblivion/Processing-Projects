planet obit = new planet(100,90,50);
planet cent = new planet(0,0,70);

boolean top = true;
float rad;
float foc;

void setup() {
  size(1000,800);
  background(10);
}

void draw() {
  //Background stuff
  //background(10);
  colorMode(HSB,360,100,100);
  translate(width/2,height/2);
  cent.render(0,0);
  
  //Orbitting body
  noStroke();
  fill(color(207,96,64));
  foc = sqrt(pow(obit.a, 2) - pow(obit.b, 2));
  rad = sqrt(pow(obit.x, 2)+pow(obit.y, 2));
  sqrt(4*((2/obit.a)-(1/rad)));
  
}