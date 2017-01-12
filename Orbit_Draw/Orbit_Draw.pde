planet obit = new planet(100,90,50);
planet cent = new planet(0,0,70);

boolean top = true;

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
  if (!top) {
    for (int i = (int)-(0.5*(obit.a+obit.b)); i < (int)(0.5*(obit.a+obit.b)); i++) {
      ellipse(i,round(sqrt((1-(pow(i, 2)/pow(obit.a, 2)))*pow(obit.b, 2))), 2 ,2);
    }
  } else {
    for (int i = (int)(0.5*(obit.a+obit.b)); i > (int)-(0.5*(obit.a+obit.b)); i--) {
      ellipse(i,round(-sqrt((1-(pow(i, 2)/pow(obit.a, 2)))*pow(obit.b, 2))), 2, 2);
      top = false;
    }
  }
}