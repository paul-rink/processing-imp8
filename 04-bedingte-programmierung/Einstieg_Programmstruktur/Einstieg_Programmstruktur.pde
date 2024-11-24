float ballX;
float ballY;
float playerY;
int scoreP1;


void setup() {
  size(800,400);
  ballX = width/2;
  ballY = height/2;
  playerY = height/2-50;
  scoreP1 = 0;
}

void draw() {
  ballX = ballX + 4;
  ballY = ballY + 2;
  background(0);
  circle(ballX, ballY, 50);
  rect(20, playerY, 10, 100);
}
