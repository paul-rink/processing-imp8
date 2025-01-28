float circleX;
float circleY;
float circleVy;
int lineY;//Bodenlinie
boolean leftPressed;
boolean rightPressed;

void setup() {
  size(800,400);
  circleX = width/2;
  circleY = height/2;
  circleVy = 0;
  lineY = height - 50;
  leftPressed = false;
  rightPressed = false;
}

void draw() {
  circleY = circleY + circleVy;
  if(circleY > lineY - 25) {
    circleY = lineY-25;
    circleVy = 0;
  } else {
    circleVy = circleVy + 1;
  }
  if(leftPressed && circleX > 25) {
    circleX = circleX - 3;
  }
  if(rightPressed && circleX < width - 25) {
    circleX = circleX + 3;
  }

  background(255);
  line(0, lineY, width, lineY);
  circle(circleX, circleY, 50);
}

void keyPressed() {
  if(key == ' ') {
    circleVy = circleVy - 10;
  } else if (keyCode == LEFT) {
    leftPressed = true;
  } else if (keyCode == RIGHT) {
    rightPressed = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    leftPressed = false;
  } else if (keyCode == RIGHT) {
    rightPressed = false;
  }
}
