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
   
  StarClasses starClass;
  
  void generate() {
    int select = floor(random(1, 17)+0.5);
    if (select == 1) {
      starClass = StarClasses.O;
    } else if (select == 2) {
      starClass = StarClasses.B;
    } else if (select >= 3 && select <= 4) {
      starClass = StarClasses.A;
    } else if (select >= 5 && select <= 6) {
      starClass = StarClasses.F;
    } else if (select >= 7 && select <= 9) {
      starClass = StarClasses.G;
    } else if (select >= 10 && select <= 13) {
      starClass = StarClasses.K;
    } else {
      starClass = StarClasses.M;
    }
    
    switch (starClass) {
      case O:
        red = 76;
        grn = 118;
        blu = 255;
        d = floor(random(10,30));
        break;
      case B:
        red = 132;
        grn = 161;
        blu = 255;
        d = floor(random(20,50));
        break;
      case A:
        red = 211;
        grn = 221;
        blu = 255;
        d = floor(random(50,75));
        break;
      case F:
        red = 255;
        grn = 255;
        blu = 255;
        d = floor(random(60,80));
        break;
      case G:
        red = 255;
        grn = 240;
        blu = 130;
        d = floor(random(50,80));
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
        d = floor(random(90,200));
        break;
    }
    r = map(red, 0, 180, 0, 255);
    g = map(grn, 0, 180, 0, 255);
    b = map(blu, 0, 180, 0, 255);
    println("Star class: " + starClass);
  }
  
  void show() {
    noFill();
    
    float bloom = 200;
    
    for (int i = 0; i < bloom; i++) {
      stroke(map(red - (float)(i/bloom * Math.E) * red,red - (float)(i/bloom * Math.E) * red,255,red - (float)(i/bloom * Math.E) * red,100), 
            map(grn - (float)(i/bloom * Math.E) * grn,grn - (float)(i/bloom * Math.E) * grn,255,grn - (float)(i/bloom * Math.E) * grn,100), 
            map(blu - (float)(i/bloom * Math.E) * blu,blu - (float)(i/bloom * Math.E) * blu,255,blu - (float)(i/bloom * Math.E) * blu,100));
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