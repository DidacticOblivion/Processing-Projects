enum PlanetClasses {Minor, Rocky, Gas}
enum PlanetTypes {Planetoid, Mercurian, Subterran, Terran, Superterran, Neptunian, Jovian}

class Planet {
  
  Star parentStar;
  
  float d;
  color pColor;
  boolean canHaveMoon;
  
  //Orbital peramiters
  float radius;
  float step;
  
  PVector pos = new PVector();
  
  Planet(float _step, Star parent) {
    step = _step;
    parentStar = parent;
  }
  
  
  
  PlanetClasses pClass;
  PlanetTypes pType;
  
  void generate() {
    radius = parentStar.radius;
    colorMode(HSB, 360, 100, 200);
    int select = floor(random(1,4) + 0.5);
    if (select == 1) {
      pClass = PlanetClasses.Minor;
      radius += random(50);
    } else if (select == 2) {
      pClass = PlanetClasses.Rocky;
      radius += random(50, 100);
    } else if (select == 3) {
      pClass = PlanetClasses.Gas;
      radius += random(100, 300);
    } else if (select == 4) {
      pClass = PlanetClasses.Minor;
      radius += random(300, 350);
    }
    switch (pClass) {
      case Minor:
        select = floor(random(1,2)+ 0.5);
        if (select == 1) {
          pType = PlanetTypes.Planetoid;
          pColor = color(32,random(50),100);
          d = random(6,10);
        } else {
          pType = PlanetTypes.Mercurian;
          select = floor(random(1,7) + 0.5);
          pColor = color(random(20,43),random(40),100);
          d = random(10,20);
          if (select == 5) {
            canHaveMoon = true;
          }
        }
        break;
      case Rocky:
        select = floor(random(1,3)+ 0.5);
        if (select == 1) {
          pType = PlanetTypes.Subterran;
          d = random(20,25);
          select = floor(random(1,4) + 0.5);
          if (select == 4) {
            canHaveMoon = true;
          }
        } else if (select == 2) {
          pType = PlanetTypes.Terran;
          d = random(25,35);
          select = floor(random(1,3) + 0.5);
          if (select == 3) {
            canHaveMoon = true;
          }
        } else {
          pType = PlanetTypes.Superterran;
          d = random(35,50);
          select = floor(random(1,3) + 0.5);
          if (select == 3) {
            canHaveMoon = true;
          }
        }
        pColor = color(random(30,43),random(10,40),100);
        break;
      case Gas:
        select = floor(random(1,2)+ 0.5);
        if (select == 1) {
          pType = PlanetTypes.Neptunian;
          d = random(50,70);
          select = floor(random(1,3) + 0.5);
          if (select >= 2) {
            canHaveMoon = true;
          }
        } else {
          pType = PlanetTypes.Jovian;
          d = random(70,80);
          select = floor(random(1,5) + 0.5);
          if (select >= 3) {
            canHaveMoon = true;
          }
        }
        float asdf = floor(random(1, 3) + 0.5);
        if (asdf == 1) {
          pColor = color(random(34), random(70, 100), 100);
        } else if (asdf == 2) {
          pColor = color(172, random(30, 70), 100);
        } else {
          pColor = color(random(190, 246), random(50, 80), 100);
        }
        break;
    }
    println("Planet type: " + pType);
    println("Moon poosible: " + canHaveMoon);
  }
  
  
  
  float vel() {
    return sqrt(5 / (radius * radius));
  }
  
  void show() {
    float x = 1.5 * radius * cos(step);
    float y = 1.5 * radius * sin(step);
    
    colorMode(HSB, 360, 100, 100);
    fill(pColor);
    stroke(pColor);
    
    ellipse(x,y,d,d);
    
    step += vel();
  }
}