class Button {
  //Position and Size
  PVector pos = new PVector();
  PVector dim = new PVector();
  //Mouse interaction based off of these
  boolean pressed = false;
  boolean pressedOnce = false;
  boolean lastButtonState = false;
  boolean hovering = false;
  //Color presets
  color bgColor = color(155);
  color pressedColor = color(75);
  color hoverColor = color(200);
  //Text stuff
  String text = null;
  float textScale = 12;
  color textColor = color(255);
  color pressedTextColor = color(175);
  color hoverTextColor = color(100);
  
  //Constructors
  Button(float x, float y, float dimX, float dimY, String t) {
    pos = new PVector(x - dimX/2, y - dimY/2);
    dim = new PVector(dimX, dimY);
    text = t;
    text(text, pos.x, pos.y, dim.x, dim.y);
  }
  
  Button(float x, float y, float dimX, float dimY) {
    pos = new PVector(x - dimX/2, y - dimY/2);
    dim = new PVector(dimX, dimY);
    text("", pos.x, pos.y, dim.x, dim.y);
  }
  
  
  //Logic for mouse/button interaction
  void bounds() {
    if (mouseX < pos.x + dim.x && mouseX > pos.x && mouseY < pos.y + dim.y && mouseY > pos.y) {
      hovering = true;
      //Pressed Variable
      if (mousePressed) {
        hovering = false;
        pressed = true;
      } else {
        pressed = false;
        lastButtonState = false;
      }
      //Pressed Once Variable
      if (mousePressed && !lastButtonState) {
        pressedOnce = true;
        lastButtonState = true;
      } else {
        pressedOnce = false;
      }
      
    } else {
      hovering = false;
    }
  }
  
  //Graphical stuff
  void show() {
    noStroke();
    color c = bgColor;
    color t = textColor;
    
    bounds();
    
    if (hovering && !pressed) {
      c = hoverColor;
      t = hoverTextColor;
    } else if (pressed && !hovering) {
      c = pressedColor;
      t = pressedTextColor;
    }
    
    fill(c);
    rect(pos.x, pos.y, dim.x, dim.y);
    if (text != null) {
      fill(t);
      textAlign(CENTER, CENTER);
      textSize(textScale);
      text(text, pos.x, pos.y, dim.x, dim.y);
    }
  }
}