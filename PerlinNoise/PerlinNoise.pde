int x;
int y;
float z1;
float z2;
float z3;
enum Screens {ONE,TWO,THREE,FOUR,FIVE}
Screens screens = Screens.ONE;

boolean depressed = false;

//For Perlin Noise copy
float xoff = 0.0;
float noiseScale = 0.02;

//For Flow Field
float scl = 5;
float rows;
float cols;
float inc;
float yoff;

//The rest:
void setup() {
  size(1100,720);
  rows = floor(width/scl);
  cols = floor(height/scl);
}

void cycle() {
  switch (screens) {
    case ONE:
      screens = Screens.TWO;
      break;
      
    case TWO:
      screens = Screens.THREE;
      break;
      
    case THREE:
      screens = Screens.FOUR;
      break;
      
    case FOUR:
      screens = Screens.FIVE;
      break;
      
    case FIVE:
      screens = Screens.ONE;
      break;
  }
}

void draw() {
  switch (screens) {
    //Random Static
    case ONE:
      for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
          z1 = random(255);
          z2 = random(255);
          z3 = random(255);
          set(x,y,color(z1,z2,z3));
        }
      }
      break;
    
    case TWO:
      //Perlin Noise
      background(204);
      stroke(0);
      xoff = xoff + .01;
      float n = noise(xoff) * width;
      line(n, 0, n, height);
      break;
    
    case THREE:
      //More Perlin Noise
      background(0);
      for (int x=0; x < width; x++) {
        float noiseVal = noise((mouseX+x)*noiseScale, mouseY*noiseScale);
        stroke(noiseVal*255);
        line(x, mouseY+noiseVal*80, x, height);
      }
      break;
    case FOUR:
      //Cloud
      inc = 0.01;
      yoff = 0;
      for (y = 0; y < cols; y++) {
        xoff = 0;
        for (x = 0; x < rows; x++) {
          fill(map(noise(xoff, yoff) * 255,0,255,0,50), noise(xoff, yoff) * 255, map(noise(xoff, yoff) * 255,0,255,0,50), map(noise(xoff, yoff) * 255,0,255,50,255));
          xoff += inc;
          noStroke();
          rect(x * scl, y * scl, scl, scl);
        }
        yoff += inc;
      }
      break; 
    case FIVE:
      //Flow Field
      stroke(0);
      background(255);
      inc = 0.01;
      yoff = 0;
      for (y = 0; y < cols; y++) {
        xoff = 0;
        for (x = 0; x < rows; x++) {
          xoff += inc;
          
        }
        yoff += inc;
      }
      break;
  }
  
  
  
  if (mousePressed) {
    if (!depressed) {
      cycle();
    }
    depressed = true;
  } else {
    depressed = false;
  }
}