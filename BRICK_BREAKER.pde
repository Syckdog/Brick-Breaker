import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

final int intro        = 1;
final int play         = 2;
final int gameover     = 3;

Paddle myPaddle;
Ball myBall;
ArrayList<Brick> bricks;
ArrayList<Particle> particleList;
int points = 0;
int i = 0;
int n = 0;
int brickx, bricky;
int mode = intro;

void setup() {
  size(800, 800);


  myPaddle = new Paddle();
  myBall = new Ball();

  bricks = new ArrayList<Brick>();
  n = 30;
  
  particleList = new ArrayList<Particle>();


  brickx = 0;
  bricky = 0;

  int i = 0;
  while (i < n) {
    bricks.add(new Brick());
    brickx = brickx  + 160;
    if (brickx == width) {
      brickx = 0;
      bricky = bricky + 50;
    }
    i++;
  }
}

void draw() {
  background(0);

  if (mode==intro) {
    intro();
  } else if (mode==play) {
    play();
  } else if (mode==gameover) {
    gameover();
  } else {
  }
}

void mouseReleased() {
  if (mode==intro) {
    introClicks();
  } else if (mode==play) {
    playClicks();
  } else if (mode==gameover) {
    gameoverClicks();
  } else {
  }
}
