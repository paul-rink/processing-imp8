//Initialisierung der Spiele-Variablen
//Spieler
int paddleWidth;
int paddleHeight;
int leftPaddleX;
int rightPaddleX;
int leftPaddleY;
int rightPaddleY;
boolean WPressed;
boolean SPressed;
boolean UpPressed;
boolean DownPressed;
int leftScore;
int rightScore;
//Baelle
int numBalls;
int ballSize;
int speedModifier;
float BallX;
float BallY;
float BallSpeedX;
float BallSpeedY;

void setup() {
  //Aufbau des Spiels:
  size(1080, 720);
  //Erste Wertezusweisung aller Variablen:
  paddleWidth = 10;
  paddleHeight = 60;
  leftPaddleX = 30;
  rightPaddleX = width - 30 - paddleWidth;;
  leftPaddleY = height / 2 - paddleHeight / 2;;
  rightPaddleY = height / 2 - paddleHeight / 2;;
  WPressed = false;
  SPressed = false;
  UpPressed = false;
  DownPressed = false;
  leftScore = 0;
  rightScore = 0;
  
  numBalls = 7;
  ballSize = 20;
  speedModifier = 4;
  BallX = width/2;
  BallY = height/2;
  while(BallSpeedX > -0.5 &&  BallSpeedX < 0.5) {//Sicherstellen, dass der Ball sich schnell genug in X-Richtung bewegt
      BallSpeedX = random(-1,1)  * speedModifier;
      BallSpeedY = random(-1,1)  * speedModifier;
    }
}

void draw() {
  //Logik des Spiels:
  //Bewegen der Spieler:
  // Update paddles based on key states
  if (WPressed) {
    if(leftPaddleY > 5) {
      leftPaddleY -= 5;
    }
  }
  if (SPressed) {
    if(leftPaddleY < height - (5+paddleHeight)) {
      leftPaddleY += 5;
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
  
  //Bewegen der Baelle: 
    BallX = BallX + BallSpeedX;
    BallY = BallY + BallSpeedY;

  //Kollisionspruefung der Baelle:
  
    // Ball abprallen Oben/Unten:
    if (BallY < 0 + ballSize/2 || BallY > height - ballSize/2) {
      BallSpeedY *= -1;
    }
    // Ball zuruecksetzen Links/Rechts
    if (BallX < 0) {
      rightScore++;
      resetBall();
    } else if (BallX > width) {
      leftScore++;
      resetBall();
    }
    
    // Ball Kollision mit Paddles
    if (circRectColl(BallX, BallY, ballSize, leftPaddleX, leftPaddleY, paddleWidth, paddleHeight)) {
      BallSpeedX *= -1;
      BallX = leftPaddleX + paddleWidth + ballSize / 2;// Sicherstellen, dass der Ball nicht im Spieler ist, nach Kollsion 
    }
    if (circRectColl(BallX, BallY, ballSize, rightPaddleX, rightPaddleY, paddleWidth, paddleHeight)) {
      BallSpeedX *= -1;
      BallX = rightPaddleX - ballSize / 2;// Sicherstellen, dass der Ball nicht im Spieler ist, nach Kollsion 
 
    }
  
  // Zeichnen des Spiels:
  background(0);
  fill(255);
  rect(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight);
  rect(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight);
  circle(BallX, BallY, ballSize);
  // Anzeigen der Scores
  textSize(32);
  textAlign(CENTER, TOP);
  fill(255);
  text(leftScore, width / 4, 20);
  text(rightScore, 3 * width / 4, 20);
  
  
}

void resetBall() {
    BallX = width / 2;
    BallY =  height / 2;
    BallSpeedX = 0;
    while(BallSpeedX > -0.5 &&  BallSpeedX < 0.5) {//Sicherstellen, dass der Ball sich schnell genug in X-Richtung bewegt
      BallSpeedX = random(-1,1)  * speedModifier;
      BallSpeedY = random(-1,1)  * speedModifier;
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
    
boolean circRectColl(float circleX, float circleY, float durchmesser, float rectX, float rectY, float rectWidth, float rectHeight) {

  // Variablen die zum testen der Seite verwendet werden
  float testX = circleX;
  float testY = circleY;

  // Welche Kante ist am nächsten?
  if (circleX < rectX) {
    testX = rectX;      // teste linke Kante
  } else if (circleX > rectX+rectWidth){
    testX = rectX+rectWidth;   // teste rechte Kante
  }
  if (circleY < rectY) {
    testY = rectY;      // teste obere Kante
  } else if (circleY > rectY+rectHeight) {
    testY = rectY+rectHeight;   // teste untere Kante
  }

  // Abstand zu nächsten Kante berechnen
  float distX = circleX-testX;
  float distY = circleY-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );
 
  // Wenn der Abstand zur nächsten Kante kleiner als der Radius ist, berührt der Kreis das Rechteck
  float radius = durchmesser / 2;
  if (distance <= radius) {
    return true;
  }
  return false;
}
