float ballX;
float ballY;
float ballVx;
float ballVy;

void setup() {
  size(400,800);
  ballX = width / 2;
  ballY = width / 2;
  ballVx = 4;
  ballVy = 1;
}
void draw() {
  background(0);
  circle(ballX, ballY, 50);
  ballX = ballX + ballVx;
  ballY = ballY + ballVy;
  
