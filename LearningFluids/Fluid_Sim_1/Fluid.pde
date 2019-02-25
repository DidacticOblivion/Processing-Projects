final int N = 256;
final int iter = 10;

int IX(int x, int y) {
  return x + y * N;
}

class Fluid {
  int size;
  float dt;
  float diff;
  float visc;
  
  float[] s;
  float[] density;
  
  float[] Vx;
  float[] Vy;
  
  float[] Vx0;
  float[] Vy0;
  
  Fluid(float dt, float diffusion, float viscosity) {
    this.size = N;
    this.dt = dt;
    this.diff = diffusion;
    this.visc = viscosity;
    
    this.s = new float[N * N];
    this.density = new float[N * N];
    
    this.Vx = new float[N * N];
    this.Vy = new float[N * N];
    
    this.Vx0 = new float[N * N];
    this.Vy0 = new float[N * N];
  }
  
  void addDensity(int x, int y, float amount) {
    int index = IX(x, y);
    this.density[index] += amount;
  }
  
  void addVelocity(int x, int y, float amountX, float amountY) {
    int index = IX(x, y);
    this.Vx[index] += amountX;
    this.Vy[index] += amountY;
  }
}

void diffuse (int b, float[] x, float[] x0, float diff, float dt) {
  float a = dt * diff * (N - 2) * (N - 2);
  lin_solve(b, x, x0, a, 1 + 6 * a, iter, N);
}
