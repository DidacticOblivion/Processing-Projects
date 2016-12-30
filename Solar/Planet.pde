class Planet {
  float d;
  boolean canHaveMoon = false;
  
  color pColor;
  
  PlanetClasses pClass;
  PlanetTypes pType;
  
  void generate() {
    int select = floor(random(1,4) + 0.5);
    if (select == 1 || select == 4) {
      pClass = PlanetClasses.Minor;
    } else if (select == 2) {
      pClass = PlanetClasses.Rocky;
    } else if (select == 3) {
      pClass = PlanetClasses.Gas;
    }
    switch (pClass) {
      case Minor:
        select = floor(random(1,2)+ 0.5);
        if (select == 1) {
          pType = PlanetTypes.Planetoid;
          pColor = color(38,random(34),34);
          d = random(6,10);
        } else {
          pType = PlanetTypes.Mercurian;
          select = floor(random(1,7) + 0.5);
          pColor = color(38,random(9,20),37);
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
        pColor = color(33,random(18,37),44);
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
        float asdf = floor(random(1,3) + 0.5);
        if (asdf == 1) {
          pColor = color(9,random(19,84),66);
        } else if (asdf == 2) {
          pColor = color(72,random(28,80),68);
        } else {
          pColor = color(204,69,random(47,79));
        }
        break;
    }
    println("Planet type: " + pType);
    println("Moon poosible: " + canHaveMoon);
  }
  
  void show(float x, float y) {
    colorMode(HSB, 360, 100, 100);
    fill(pColor);
    stroke(pColor);
    ellipse(x,y,d,d);
  }
}