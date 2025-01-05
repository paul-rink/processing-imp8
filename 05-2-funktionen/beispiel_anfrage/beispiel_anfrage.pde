float ballX;
float ballY;

void setup() {
  size(500,500);
  frameRate(2);
  ballX = 0;
  ballY = 0;
}

void draw() {
  ballSpringt();
  
  
  background(100);
  if(ballRechts()) {
    fill(0);
  } else {
    fill(255);
  }
  circle(ballX, ballY, 50);
}


void ballSpringt() {
  ballX = random(0,500);
  ballY = random(0,500);
}

boolean ballRechts() {
  if(ballX > width/2) {
    return true;
  } 
  return false;
}
