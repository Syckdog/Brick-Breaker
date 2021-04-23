class Paddle {

  float sx, sy, sw, sh;

  Paddle() {
    sx = width/2;
    sy = height - 100;
    sw = 100;
    sh = 25;
  }

  void show() {
    fill (255);
    rect(sx, sy, sw, sh);
  }

  void act() {
    sx = mouseX;
    if (sx < 0) sx = 0;
    if (sx > width - 100) sx = width - 100;
  }
}
