import processing.sound.*;

Puck puck;
Paddle padL;
Paddle padR;
int leftScore, rightScore;
SoundFile ding;


void settings() {
  size(1280, 720);
}

void setup() {
  puck = new Puck();
  padL = new Paddle(width/25);
  padR = new Paddle(24 * width/25);
  leftScore = 0;
  rightScore = 0;
  
  ding = new SoundFile(this, "Gong-sound.mp3");
  ding.amp(0.5);
}

void draw() {
  background(0);
  padL.show();
  padR.show();

  padL.update();
  padR.update();

  puck.checkPaddleL(padL);
  puck.checkPaddleR(padR);

  puck.update();
  puck.edge();
  puck.show();
  
  fill(255);
  textSize(32);
  text(leftScore, 10, 40);
  text(rightScore, width - 30, 40);
}


void keyReleased() {
  padL.move(0);
  padR.move(0);
}

void keyPressed() {
  if ( key == 'a') {
    padL.move(-10);
  } else if (key == 'z') {
    padL.move(10);
  } else if ( key == 'j') {
    padR.move(-10);
  } else if (key == 'm') {
    padR.move(10);
  }
}
