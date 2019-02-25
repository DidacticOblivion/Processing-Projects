float scl = 50;
float period = TWO_PI * 100 / scl;

boolean keyPressedPrev = false;
float iter = 0;

void setup() {
  size(1000, 700);
  render();
}

void draw() {
  if (!keyPressed) {
    keyPressedPrev = false;
  }
}

void keyPressed() {
  if (!keyPressedPrev) {
    if (keyCode == UP) {
      iter++;
    } else if (keyCode == DOWN && iter > 0) {
      iter--;
    }
    keyPressedPrev = true;
    render();
  }
}

void render() {
  background(0);
  noFill();
  strokeWeight(2);
  translate(width / 2, height / 2);
  drawGrid();

  //cosineTarget();
  //taylorCosine(floor(iter));
  //sineTarget();
  //taylorSine(floor(iter));
  randTarget();
  taylorRand(floor(iter));
}


void taylorCosine(int terms) {
  stroke(255, 100, 150);
  beginShape();
  for (float i = -1; i <= 1; i += 0.01) {
    float x = map(i, -1, 1, -period, period);
    // Talor Polynomial --------------------------------------------------------------
    float y = 0;
    for (int t = 0; t <= terms * 2; t += 2) {
      y += pow(-1, t / 2) * 1/fact(t) * pow(x, t);
    }
    vertex(x * scl, -y * scl);
  }
  endShape();
  println("Taylor Polynomial drawn.");
}

void taylorSine(int terms) {
  stroke(255, 100, 150);
  beginShape();
  for (float i = -1; i <= 1; i += 0.01) {
    float x = map(i, -1, 1, -period, period);
    // Talor Polynomial --------------------------------------------------------------
    float y = 0;
    for (int t = 1; t <= terms * 2 + 1; t += 2) {
      y -= pow(-1, 1 - t / 2) * 1/fact(t) * pow(x, t);
    }
    vertex(x * scl, -y * scl);
  }
  endShape();
  println("Taylor Polynomial drawn.");
}

void taylorRand(int terms) {
  stroke(255, 100, 150);
  beginShape();
  for (float x = -1; x <= 1; x += 0.01) {
    // Talor Polynomial --------------------------------------------------------------
    float y = -0.5;
    switch (terms) {
      case 1:
        y += 3 * pow(x, 2);
        break;
      case 2:
        y += 3 * pow(x, 2) - 24/fact(4) * pow(x, 4);
        break;
      case 3:
        y += 3 * pow(x, 2) - 24/fact(4) * pow(x, 4) + 360/fact(5) * pow(x, 5);
        break;
      default:
        break;
    }
    vertex(x * height / 2, -y * height / 2);
  }
  endShape();
  println("Taylor Polynomial drawn.");
}

void cosineTarget() {
  stroke(200, 200, 0);
  beginShape();
  for (float x = -1; x <= 1; x += 0.01) {
    float y = cos(map(x, -1, 1, -period, period)); //  Approximating Cosine ---------
    vertex(x * scl * period, -y * scl);
  }
  endShape();
  println("Cosine Function drawn.");
}

void sineTarget() {
  stroke(200, 200, 0);
  beginShape();
  for (float x = -1; x <= 1; x += 0.01) {
    float y = sin(map(x, -1, 1, -period, period)); //  Approximating Sine ---------
    vertex(x * scl * period, -y * scl);
  }
  endShape();
  println("Sine Function drawn.");
}

void randTarget() {
  stroke(200, 200, 0);
  beginShape();
  for (float x = -1; x <= 1; x += 0.01) {
    float y = 3 * pow(x, 5) - pow(x, 4) + 3 * pow(x, 2) - 0.5; //  Approximating Sine ---------
    vertex(x * height / 2, -y * height / 2);
  }
  endShape();
  println("Random Function drawn.");
}


void drawGrid() {
  stroke(60);
  line(0, -height / 2, 0, height / 2);
  line(-width / 2, 0, width / 2, 0);
  for (float i = PI * scl; i <= width / 2; i += PI * scl) {
    line(i, -10, i, 10);
    line(-i, -10, -i, 10);
  }
  for (float i = scl; i <= height / 2; i += scl) {
    line(-10, i, 10, i);
    line(-10, -i, 10, -i);
  }
}

float fact(float input) {
  float output = 1;
  for (int i = 1; i <= input; i++) {
    output *= i;
  }
  return output;
}

float log10(float arg) {
  return log(arg) / log(10);
}
