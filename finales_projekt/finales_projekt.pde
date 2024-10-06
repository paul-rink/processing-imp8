int paddleWidth = 10;
int paddleHeight = 60;
int ballSize = 20;

int leftPaddleX = 30;
int rightPaddleX;
int leftPaddleY;
int rightPaddleY;
boolean WPressed = false;
boolean SPressed = false;
boolean UpPressed = false;
boolean DownPressed = false;

int numBalls = 3;
int speedModifier = 4;
float[] BallX;
float[] BallY;
float[] BallSpeedX;
float[] BallSpeedY;

int leftScore = 0;
int rightScore = 0;

void setup() {
  size(800, 400);
  leftPaddleY = height / 2 - paddleHeight / 2;
  rightPaddleX = width - 30 - paddleWidth;
  rightPaddleY = height / 2 - paddleHeight / 2;
  
  BallX = new float[numBalls];
  BallY = new float[numBalls];;
  BallSpeedX = new float[numBalls];;
  BallSpeedY = new float[numBalls];;
  
  for (int i = 0; i < numBalls; i++) {
    resetBall(i);
  }
}

void draw() {
  background(0);
  
  // Draw paddles
  fill(255);
  rect(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight);
  rect(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight);
  
  // Draw and move balls
  for (int i = 0; i < numBalls; i++) {
    ellipse(BallX[i], BallY[i], ballSize, ballSize);
    BallX[i] = BallX[i] + BallSpeedX[i];
    BallY[i] = BallY[i] + BallSpeedY[i];
    
    // Ball collision with top and bottom
    if (BallY[i] < 0 + ballSize/2 || BallY[i] > height - ballSize/2) {
      BallSpeedY[i] *= -1;
    }
    
    // Ball collision with paddles
    if (BallX[i] - ballSize / 2 < leftPaddleX + paddleWidth && 
        BallY[i] > leftPaddleY && BallY[i] < leftPaddleY + paddleHeight) {
      BallSpeedX[i] *= -1;
      BallX[i] = leftPaddleX + paddleWidth + ballSize / 2;
    }
    
    if (BallX[i] + ballSize / 2 > rightPaddleX && 
        BallY[i] > rightPaddleY && BallY[i] < rightPaddleY + paddleHeight) {
      BallSpeedX[i] *= -1;
      BallX[i] = rightPaddleX - ballSize / 2;
    }
    
    // Ball out of bounds
    if (BallX[i] < 0) {
      rightScore++;
      resetBall(i);
    } else if (BallX[i] > width) {
      leftScore++;
      resetBall(i);
    }
  }
  
  // Display scores
  textSize(32);
  textAlign(CENTER, TOP);
  fill(255);
  text(leftScore, width / 4, 20);
  text(rightScore, 3 * width / 4, 20);
  
  // Update paddles based on key states
  if (WPressed) {
    leftPaddleY -= 5;
  }
  if (SPressed) {
    leftPaddleY += 5;
  }
  if (UpPressed) {
    rightPaddleY -= 5;
  }
  if (DownPressed) {
    rightPaddleY += 5;
  }
  
  
  // Constrain paddles within screen
  leftPaddleY = constrain(leftPaddleY, 0, height - paddleHeight);
  rightPaddleY = constrain(rightPaddleY, 0, height - paddleHeight);
}

void resetBall(int index) {
    BallX[index] = width / 2;
    BallY[index] =  height / 2;
    BallSpeedX[index] = random(-1,1)  * speedModifier;
    BallSpeedY[index] = random(-1,1)  * speedModifier;
}

void keyPressed() {
  //Left Paddle controls
  if (key == 'w' || key == 'W') {
      WPressed = true;
    } else if (key == 's' || key == 'S') {
      SPressed = true;
    }
    // Right paddle controls
    if (keyCode == UP) {
      UpPressed = true;
    } else if (keyCode == DOWN) {
      DownPressed = true;
    }
}

void keyReleased() {
  //Left Paddle controls
  if (key == 'w' || key == 'W') {
      WPressed = false;
    } else if (key == 's' || key == 'S') {
      SPressed = false;
    }
    // Right paddle controls
    if (keyCode == UP) {
      UpPressed = false;
    } else if (keyCode == DOWN) {
      DownPressed = false;
    }
}
