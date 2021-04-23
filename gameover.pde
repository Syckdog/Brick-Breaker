void gameover() {
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);
  text ("Game Over", width/2, height/2 - 40);
  text ("Click to play again", width/2, height/2 + 40);
}

void gameoverClicks() {
  mode = intro;
}
