float t = 0;
float space = 1.5;
int tail = 20;
boolean invert = true;
float speed = 0.2;
int scl = 300;

public void setup() {
  size(1200,800);
  background(20);
}

float x1(float t) {
  float x = sin(t / 20) * scl;
  
  return x;
}

float y1(float t) {
  float y = cos(t / 30) * scl / 2;
  
  
  return y;
}

float x2(float t) {
  float x = cos(t / 30) * scl / 2;
  
  return x;
}

float y2(float t) {
  float y = sin(t / 20) * scl;
  
  if (invert) {
    return -y;
  } else {
    return y;
  }
}

public void draw() {
  background(0);
  stroke(255);
  strokeWeight(5);
  
  translate(width/2,height/2);
  
  for (int i = 0; i < tail; i++) {
    if (i > 0) {
      stroke(150,150,255,200);
      line(x1(t - space * i),y1(t - space * i),x1(t - space * i + space),y1(t - space * i + space));
      stroke(150,255,150,200);
      line(x2(t - space * i),y2(t - space * i),x2(t - space * i + space),y2(t - space * i + space));
    }
    stroke(255,100);
    line(x1(t - space * i),y1(t - space * i),x2(t - space * i),y2(t - space * i));
  }
  
  t += speed;
}