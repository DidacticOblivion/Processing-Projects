//Generic UIObject that everything else is based upon
abstract class UIObject {
  PVector pos = new PVector(0, 0);
  PVector boundingSize = new PVector(0, 0);

  private boolean lastMouseState = false;
  boolean mouseTapped = false;

  void mouseButtonCheck() {
    if (lastMouseState == false) {
      if (mousePressed && mouseTapped == false) {
        mouseTapped = true;
      } else {
        mouseTapped = false;
      }
    }
    lastMouseState = mouseTapped;
  }

  boolean inBounds() {
    if (mouseY >= pos.y && mouseY <= pos.y + boundingSize.y) {
      if (mouseX >= pos.x && mouseX <= pos.x + boundingSize.x) {
        return true;
      }
    }

    return false;
  }

  abstract void update(); // <-- Method for updating UIObjects
}


//For entering custom text
class UITextField extends UIObject {
  String contents = "";
  String placeHolder = "Type here...";

  boolean hasContents;
  boolean selected = false;

  int fontSize = 20;
  float backgroundWidth = 200;
  float backgroundHeight = 26;

  color fontColor = color(42);
  color backgroundColor = color(200, 200, 200); // <-- Change this to a better color system

  UITextField(float x, float y) {
    pos = new PVector(x, y);
    hasContents = (contents == "" ? false : true);
    textAlign(LEFT, CENTER);
    boundingSize = new PVector(backgroundWidth, backgroundHeight);
  }

  UITextField(float x, float y, int size, float w, float h) { //Specify size
    pos = new PVector(x, y);
    fontSize = size;
    backgroundWidth = w;
    backgroundHeight = h;
    hasContents = (contents == "" ? false : true);
    textAlign(LEFT, CENTER);
    boundingSize = new PVector(backgroundWidth, backgroundHeight);
  }

  UITextField(float x, float y, color text, color back) { //Specify colors
    pos = new PVector(x, y);
    fontColor = text;
    backgroundColor = back;
    hasContents = (contents == "" ? false : true);
    textAlign(LEFT, CENTER);
    boundingSize = new PVector(backgroundWidth, backgroundHeight);
  }

  UITextField(float x, float y, int size, float w, float h, color text, color back) { //Specify colors and size  
    pos = new PVector(x, y);
    fontSize = size;
    fontColor = text;
    backgroundWidth = w;
    backgroundHeight = h;
    backgroundColor = back;
    hasContents = (contents == "" ? false : true);
    textAlign(LEFT, CENTER);
    boundingSize = new PVector(backgroundWidth, backgroundHeight);
  }

  void update() {
    if (inBounds()) {
      if (mouseTapped) {
        selected = !selected;
        println(selected);
      }
    }

    fill(backgroundColor);
    noStroke();
    rect(pos.x, pos.y, boundingSize.x, boundingSize.y);

    fill(fontColor, (hasContents ? 255 : 180));
    text((hasContents || selected ? contents : placeHolder), pos.x + 10, pos.y, boundingSize.x - 10, boundingSize.y);

    if (selected) {
      //do typing stuff
    }
  }
}



class UIButton {
}



class UISlider {
}