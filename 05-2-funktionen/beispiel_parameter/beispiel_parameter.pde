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
  
  if(beruehrtRand(ballX, ballY, 25)) {
    background(255,0,0);
  } else {
    background(0,255,0);
  }
  
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

boolean beruehrtRand(float x, float y, float rad) {
  if(x < rad || x > width-rad || y < rad || y > height-rad) {
    return true;
  }
  return false;
}
  
