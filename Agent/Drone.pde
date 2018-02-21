class Drone {
  
  PShape d;
  float scl = 1;
  float theta = 0;
  float gain = 1;
  
  PVector pos = new PVector(0, 0);
  
  Drone(float s, float g) {
    scl = s;
    gain = g;
    d = createShape();
    d.beginShape();
    d.stroke(0);
    d.fill(0);
    d.vertex(-5, 2.5 * s);
    d.vertex(5 * s, 5 * s);
    d.vertex(-5, 7.5 * s);
    d.endShape(); 
  }
  
  
  void moveTo(int _x, int _y) {
    float pSlope = (pos.x - _x) / (pos.y - _y);
    target = atan(pSlope);
    
    println((target / PI) + "π");
  }
  
  
  //PD Controller
  float kp = 0.1;
  float kd = 0;
  float err = 0;
  float pErr = 0;
  float der = 0;
  float target = 0;
  
  
  void update() {
    err = target - theta;
    
    der = (err - pErr) / frameRate;
    
    rot(d, (err * kp) + (der * kd));
    
    pos.add(new PVector(cos(theta) * gain, sin(theta) * gain));
    shape(d, pos.x, pos.y);
    
    pErr = err;
  }
  
  void rot(PShape s, float a) {
    theta += a;
    s.rotate(a);
  }
  
}