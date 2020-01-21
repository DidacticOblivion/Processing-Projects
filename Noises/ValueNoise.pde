class VNoise {
  int seed;
  
  // define random seeded points and LERP between the corners
  VNoise() {
    seed = floor(random(10000) + 0.5) - 5000;
  }
  
  VNoise(int seed) {
    this.seed = seed;
  }
  
  
  //Come up with a hash function to use
  float n(float x, float y) {
    randomSeed(hash(x, y));
    float tl = random(1);
    randomSeed(hash(x + 1, y));
    float tr = random(1);
    randomSeed(hash(x, y + 1));
    float bl = random(1);
    randomSeed(hash(x + 1, y + 1));
    float br = random(1);
    
    float xpct = x - (floor(x) * 1.0);
    float ypct = y - (floor(y) * 1.0);
    
    float btm = lerp(bl, br, xpct);
    float top = lerp(tl, tr, xpct);
    return(lerp(btm, top, ypct));
  }
  
  int hash(float x, float y) {
    String data = "" + x + y + seed;
    return data.hashCode();
  }
}
