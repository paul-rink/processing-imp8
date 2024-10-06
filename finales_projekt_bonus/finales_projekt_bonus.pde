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

int numBalls = 5;
int speedModifier = 4;
float[] BallX;
float[] BallY;
float[] BallSpeedX;
float[] BallSpeedY;
float[] BallTyp;

int leftScore = 0;
int rightScore = 0;

void setup() {
  size(1080, 720);
  leftPaddleY = height / 2 - paddleHeight / 2;
  rightPaddleX = width - 30 - paddleWidth;
  rightPaddleY = height / 2 - paddleHeight / 2;
  
  BallX = new float[numBalls];
  BallY = new float[numBalls];
  BallSpeedX = new float[numBalls];
  BallSpeedY = new float[numBalls];
  BallTyp = new float[numBalls];
  
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
    if(BallTyp[i] == 0) {
      fill(255);
    } else {
      fill(255,0,0);
    }
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
          if(BallTyp[i] == 0) {
            BallSpeedX[i] *= -1;
            BallX[i] = leftPaddleX + paddleWidth + ballSize / 2;
          } else {
            resetBall(i);
            leftScore -= 1;
          }
    }
    
    if (BallX[i] + ballSize / 2 > rightPaddleX && 
        BallY[i] > rightPaddleY && BallY[i] < rightPaddleY + paddleHeight) {
       if(BallTyp[i] == 0) {
            BallSpeedX[i] *= -1;
            BallX[i] = rightPaddleX - paddleWidth - ballSize / 2;
          } else {
            resetBall(i);
            rightScore -= 1;
          }
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
    if(leftPaddleY > 5) {
      leftPaddleY -= 5;
      println(leftPaddleY);
    }
  }
  if (SPressed) {
    if(leftPaddleY < height - (5+paddleHeight)) {
      leftPaddleY += 5;
      println(leftPaddleY);
    }
  }
  if (UpPressed) {
    if(rightPaddleY > 5) {
      rightPaddleY -= 5;
    }
  }
  if (DownPressed) {
    if(rightPaddleY < height - (5+paddleHeight)) {
      rightPaddleY += 5;
    }
  }
}

void resetBall(int index) {
    BallX[index] = width / 2;
    BallY[index] =  height / 2;
    float dir = random(0,360);
    
    while( !((dir >= 45 && dir <= 135) || (dir >= 225 && dir <= 315))) {
      dir = random(0,360);
    }
    BallSpeedX[index] = sin(radians(dir))  * speedModifier;
    BallSpeedY[index] = cos(radians(dir))  * speedModifier; //Auf 1 Normierte Geschwindigkeit.
    
    if(random(0,1) > 0.8) {
    BallTyp[index] = 1;
    } else {
      BallTyp[index] = 0;
    }
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
