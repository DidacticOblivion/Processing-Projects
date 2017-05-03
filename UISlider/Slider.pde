class Slider {
  private color riseColor = color(222, 68, 65);
  private color fallColor = color(0, 0, 82);
  private color handleColor = color(0, 0, 55);
  
  PVector pos = new PVector(0,0);
  float leng;
  float thick;
  
  float percent = 0.5;
  private float drawAngle = 0;
  
  Slider(PVector p, float l, float t, float a) {
    pos = p;
    leng = l;
    thick = t;
    drawAngle = a;
  }
  
  Slider(PVector p, float l, float t, float a, float start) {
    pos = p;
    leng = l;
    thick = t;
    drawAngle = a;
    percent = start;
  }
  
  //API for changing colors
  void RiseColor(color col) {
    riseColor = col;
  }
  
  void FallColor(color col) {
    fallColor = col;
  }
  
  void HandleColor(color col) {
    handleColor = col;
  }
  
  
  void show() {
    percent = constrain(percent, 0, 1);
    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(drawAngle);
    
    noStroke();
    fill(riseColor);
    rect(0, 0, leng * percent, thick);
    fill(fallColor);
    rect(leng * percent, 0, leng - (leng * percent), thick);
    fill(handleColor);
    ellipse(leng * percent, thick * 0.5, 2.5 * thick, 2.5 * thick);
    
    popMatrix();
  }
}