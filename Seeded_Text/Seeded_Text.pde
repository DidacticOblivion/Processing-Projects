Seed[] seeds = new Seed[10];

void setup() {
  size(1000, 600);
  background(51);
  String str = "TEST";
  fill(255);
  textSize(350);
  text(str, width / 2 - 400, height / 2 + 100);
  
  for (int i = 0; i < seeds.length; i++) {
    seeds[i] = new Seed(floor(random(width)), floor(random(height)));
  }
}

void draw() {
  background(0);
  loadPixels();
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int index = x + y * width;
      if (pixels[index] > color(100)) {
        //create bubble
      }
    }
  }
  updatePixels();
  for (int i = seeds.length - 1; i > 0; i--) {
    for (int j = seeds.length - 1; j > 0; j--) {
      if (dist(seeds[i].pos.x, seeds[i].pos.y, seeds[j].pos.x, seeds[j].pos.y) <= (seeds[i].r + seeds[j].r + 4) && seeds[i] != seeds[j]) {
        break;
      } else {
        seeds[i].grow();
      }
    }
    seeds[i].show();
  }
}