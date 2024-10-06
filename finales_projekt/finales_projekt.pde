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
PVector[] balls;
PVector[] ballSpeeds;

int leftScore = 0;
int rightScore = 0;

void setup() {
  size(800, 400);
  leftPaddleY = height / 2 - paddleHeight / 2;
  rightPaddleX = width - 30 - paddleWidth;
  rightPaddleY = height / 2 - paddleHeight / 2;
  
  balls = new PVector[numBalls];
  ballSpeeds = new PVector[numBalls];
  
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new PVector(width / 2, height / 2);
    ballSpeeds[i] = PVector.random2D();
    ballSpeeds[i].mult(4);
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
    ellipse(balls[i].x, balls[i].y, ballSize, ballSize);
    balls[i].add(ballSpeeds[i]);
    
    // Ball collision with top and bottom
    if (balls[i].y < 0 || balls[i].y > height) {
      ballSpeeds[i].y *= -1;
    }
    
    // Ball collision with paddles
    if (balls[i].x - ballSize / 2 < leftPaddleX + paddleWidth && 
        balls[i].y > leftPaddleY && balls[i].y < leftPaddleY + paddleHeight) {
      ballSpeeds[i].x *= -1;
      balls[i].x = leftPaddleX + paddleWidth + ballSize / 2;
    }
    
    if (balls[i].x + ballSize / 2 > rightPaddleX && 
        balls[i].y > rightPaddleY && balls[i].y < rightPaddleY + paddleHeight) {
      ballSpeeds[i].x *= -1;
      balls[i].x = rightPaddleX - ballSize / 2;
    }
    
    // Ball out of bounds
    if (balls[i].x < 0) {
      rightScore++;
      resetBall(i);
    } else if (balls[i].x > width) {
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
  balls[index].set(width / 2, height / 2);
  ballSpeeds[index] = PVector.random2D();
  ballSpeeds[index].mult(4);
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
