class Ball {

  float vx, vy;
  float cx;     
  float cy;
  float r = 25; 
  boolean move = false;


  Ball() {
    cx = width/2;
    cy = height - 125;
    vx = 0;
    vy = -5;
  }

  void show() {
    fill(255);
    ellipse(cx, cy, r*2, r*2);
    if (move == false) {
      cx = myPaddle.sx + 50;
    }
  }

  void act() {

    if (move == true) cy = cy + vy;
    if (move == false) cy = cy;

    boolean hit = circleRect(cx, cy, r, myPaddle.sx, myPaddle.sy, myPaddle.sw, myPaddle.sh);
    if (hit) {
      if (cx > (myPaddle.sx + 50)) vx = random(1,5);
      if (cx < (myPaddle.sx + 50)) vx = random(-1,-5);
      vy = -vy;
    }
    cx = cx + vx;

    if (cx < 25 || cx > width - 25) vx = -vx;
    if (cy < 25) vy = -vy;
    if (cy > height)  mode = gameover;
  }


  boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

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
