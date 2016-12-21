class Star {
  float x;
  float y;
  float d;
  float red;
  float grn;
  float blu;
  
  private float r;
  private float g;
  private float b;
   
  Classes starClass;
  
  void generate() {
    int select = floor(random(1, 17));
    if (select == 1) {
      starClass = Classes.O;
    } else if (select == 2) {
      starClass = Classes.B;
    } else if (select >= 3 && select <= 4) {
      starClass = Classes.A;
    } else if (select >= 5 && select <= 6) {
      starClass = Classes.F;
    } else if (select >= 7 && select <= 9) {
      starClass = Classes.G;
    } else if (select >= 10 && select <= 13) {
      starClass = Classes.K;
    } else {
      starClass = Classes.M;
    }
    
    switch (starClass) {
      case O:
        red = 76;
        grn = 118;
        blu = 255;
        d = floor(random(20,50));
        break;
      case B:
        red = 132;
        grn = 161;
        blu = 255;
        d = floor(random(20,75));
        break;
      case A:
        red = 211;
        grn = 221;
        blu = 255;
        d = floor(random(75,100));
        break;
      case F:
        red = 255;
        grn = 255;
        blu = 255;
        d = floor(random(80,120));
        break;
      case G:
        red = 255;
        grn = 240;
        blu = 130;
        d = floor(random(75,100));
        break;
      case K:
        red = 252;
        grn = 177;
        blu = 123;
        d = floor(random(80,120));
        break;
      case M:
        red = 255;
        grn = 144;
        blu = 117;
        d = floor(random(80,130));
        break;
    }
    r = map(red, 0, 180, 0, 255);
    g = map(grn, 0, 180, 0, 255);
    b = map(blu, 0, 180, 0, 255);
    println(starClass);
  }
  
  void show() {
    noFill();
    
    float bloom = 100;
    
    for (float i = 0; i < bloom; i++) {
      stroke(red - (i/bloom) * red, grn - (i/bloom) * grn, blu - (i/bloom) * blu);
      ellipse(0,0,d + i,d + i);
    }
    
    strokeWeight(2);
    stroke(r, g, b);
    fill(red + 100, grn + 100, blu + 100);
    ellipse(0,0,d,d);
    
    /*for (float i = 0; i <= d; i++) {
      stroke(map((red - 2 * i/red * red),0,(red - 2 * i/red * red),(red - 2 * i/red * red)/5,(red - 2 * i/red * red)),
             map((grn - 2 * i/grn * grn),0,(grn - 2 * i/grn * grn),(grn - 2 * i/grn * grn)/5,(grn - 2 * i/grn * grn)), 
             map((blu - 2 * i/blu * blu),0,(blu - 2 * i/blu * blu),(blu - 2 * i/blu * blu)/5,(blu - 2 * i/blu * blu)));
      ellipse(0,0,i,i);
    }*/
  }
}