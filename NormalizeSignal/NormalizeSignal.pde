float[] values;

void setup() {
  size(1200, 800);
  background(100);
  values = new float[width];
  for (int i = 0; i < width; i++) {
    values[i] = height * noise(i * 0.005);
  }
}


void draw() {
  for (int x = 1; x < width; x++) {
    stroke(255, 100, 100);
    float y = height - values[x];
    point(x, y);
  }
  
  normalizeSignal(values);
}

void normalizeSignal(float[] signalData) {
  float acc = 0;
  float largest = 0;
  float smallest = height;
  for (float f : signalData) {
    acc += f;
    if (f > largest) largest = f;
    if (f < smallest) smallest = f;
  }
  acc /= (signalData.length + 1);
  
  line(0, height - acc, width, height - acc);
  line(0, height - largest, width, height - largest);
  line(0, height - smallest, width, height - smallest);
}
