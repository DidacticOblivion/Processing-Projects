planet obit = new planet(100,75,50);
planet cent = new planet(0,0,70);

boolean top = true;
float rad;
float foc;
float vStep;

float x = 0;
float y = 0;

void setup() {
  size(1000,800);
  background(10);
  obit.x = obit.a;
  obit.y = 0;
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
  ellipse(0, foc, 10, 10);
  ellipse(0, -foc, 10, 10);
  rad = sqrt(pow(obit.x, 2) + pow(obit.y, 2));
  vStep = sqrt(40 *((2/obit.a)-(1/rad)));
  
  if (top) {
    obit.x += vStep;
    obit.y = sqrt((1-(pow(obit.x,2)/pow(obit.a,2)))*pow(obit.b,2));
      ellipse(obit.x,obit.y,5,5);
    
    if (obit.y < 0) {
      top = false;
    }
  } else {
    obit.x -= vStep;
    obit.y = -sqrt((1-(pow(obit.x,2)/pow(obit.a,2)))*pow(obit.b,2));
      ellipse(obit.x,obit.y,5,5);
    
    if (obit.y > 0) {
      top = true;
    }
  }
  System.out.println("Coords: (" + x + ", " + y + ")");
  System.out.println("vStep: " + vStep);
}