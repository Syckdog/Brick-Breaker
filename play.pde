void play() {
  myPaddle.show();
  myPaddle.act();
  myBall.show();
  myBall.act();


  int i = 0;
  while (i < n) {
    Brick myBrick = bricks.get(i);
    myBrick.show();
    myBrick.act();
    i++;
  }

  int j = 0;
  while (j < particleList.size()) {
    Particle myParticle = particleList.get(j);

    if (myParticle.alive == true) {
      myParticle.show();
      myParticle.act();
      j = j + 1;
    } else {
      particleList.remove(j);
    }
  }

}

void playClicks() {
  myBall.move = true;
}
