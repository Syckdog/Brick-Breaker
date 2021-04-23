class Particle {
  float x, y, vx, vy, ax, ay, size;
  boolean alive;
  PImage firework;

  Particle(float incomingx, float incomingy) {
    x = incomingx;
    y = incomingy;
    vx = random(-5, 5);
    vy = random(-5, 5);
    size = random(10, 50);
    ax = 0;
    ay = 1;
    alive = true;
    firework = loadImage("star.png");
  }

  void show() {
    image(firework, x, y, size, size);
  }

  void act() {
    x = x + vx;
    y = y + vy;
    vx = vx + ax;
    vy = vy + ay;

    if (x < 0 || x > width || y < 0 || y > height) {
      alive = false;
    }
  }
}
