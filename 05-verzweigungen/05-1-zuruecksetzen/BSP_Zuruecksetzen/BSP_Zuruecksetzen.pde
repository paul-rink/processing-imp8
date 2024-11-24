float ballX;
float ballY;
float ballVx;
float ballVy;

void setup() {
  size(800,400);
  ballX = width / 2;
  ballY = height / 2;
  ballVx = 4;
  ballVy = 1;
}
void draw() {
  background(0);
  noFill();
  stroke(255);
  rect(1,1,width-2,height-2);
  fill(255);
  circle(ballX, ballY, 50);
  ballX = ballX + ballVx;
  ballY = ballY + ballVy;
  if(ballX > 800) {
    ballX = width/2;
    ballY = height/2;
    ballVx = ballVx * -1;
    ballVy = ballVy * -1;
  } else if(ballX < 0) {
    ballX = width/2;
    ballY = height/2;
    ballVx = ballVx * -1;
    ballVy = ballVy * -1;
  }
}
