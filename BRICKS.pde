class Brick {

  float bx, by, bw, bh;
  float HP;
  int Rage;
  int n = 30;

  Brick() {
    bx = brickx;
    by = bricky;
    bw = 160;
    bh = 50;
    HP = int(random(1, 4));
  }

  void show() {
    if (HP == 1) {
      fill(0, 255, 0);
    } else if (HP == 2) {
      fill (255, 255, 0);
    } else {
      fill (255, 0, 0);
    }
    rect(bx, by, bw, bh);

    fill (255);
    text(Rage, 700, 700);
  }

  void act() {
    boolean hit = circleBrick(myBall.cx, myBall.cy, myBall.r, bx, by, bw, bh);
    if (HP > 0) {
      if (hit) {
        HP = HP - 1;
        myBall.vy = -myBall.vy;
        myBall.vx = -myBall.vx;
        Rage = Rage + 10;
        if (HP==0) {
          bw = 0;
          bh = 0;
          int j = 0;
          while (j < n) {
          particleList.add(new Particle(bx, by));
          j = j + 1;
          }
        }
      }
    }
    if (Rage == 100) {
      myBall.vx = myBall.vx + 5;
      myBall.vy = myBall.vy + 5;
      Rage = 0;
    }
  }





  boolean circleBrick(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

    float testX = cx;
    float testY = cy;

    if (cx < rx)         testX = rx;      // test left edge
    else if (cx > rx+rw) testX = rx+rw;   // right edge
    if (cy < ry)         testY = ry;      // top edge
    else if (cy > ry+rh) testY = ry+rh;   // bottom edge

    float distX = cx-testX;
    float distY = cy-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    if (distance <= radius) {
      return true;
    }
    return false;
  }
}
