float ballX;
float ballY;

void setup() {
  size(500,500);
  frameRate(5);
  ballX = 0;
  ballY = 0;
}

void draw() {
  
  ballSpringt(); //<>//
  
  background(100);
  circle(ballX, ballY, 50);
}


void ballSpringt() {
  ballX = random(0,500); //<>//
  ballY = random(0,500);
}
