//Initialisierung aller Spielvariablen
float ballX; 
float ballY;
float ballVx;
float ballVy;
float ballSize;
float playerY;
float playerSize;
int scoreP1;
boolean wPressed;
boolean sPressed;

//Aufbau des Spiels / Festlegung aller Spielparameter
void setup() {
  size(800,400);
  ballX = width/2;
  ballY = height/2;
  ballVx = 4;
  ballVy = 2;
  ballSize = 50;
  playerSize = 100;
  playerY = height/2-playerSize/2;
  scoreP1 = 0;
  wPressed = false;
  sPressed = false;
}

void draw() {
  //Logik des Spiels
  //Ballbewegung:
  if(ballX > width - ballSize/2 || ballX < 0 + ballSize/2) {
    if(ballX > width/2) {
      scoreP1 += 1;
    }
    ballX = width/2;
    ballY = height/2;
    ballVx = ballVx * (-1);
    ballVy = ballVy * (-1);
  } else if(ballY > height- ballSize/2 || ballY < 0 + ballSize/2) {
    ballVy = ballVy * (-1);
  }
  if(circRectColl(ballX, ballY, ballSize, 20, playerY, 10, playerSize)) {
    ballVx = ballVx * (-1);
  }
  
  
  
  ballX = ballX + ballVx;
  ballY = ballY + ballVy;
  
  
  //Spielerbewegung:
  if(wPressed && playerY > 0) {
    playerY -= 4;
  }
  if(sPressed && playerY < height-playerSize) {
    playerY += 4;
  }
  
  //Zeichnen des Bilds
  background(0);
  circle(ballX, ballY, ballSize);
  rect(20, playerY, 10, playerSize);
  text(scoreP1, 10, 10);
}

//Hilfsfunktionen:
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

void keyPressed() {
  if (key == 'w') {
    wPressed = true;
  } else if (key == 's') {
    sPressed = true;
  }
}
void keyReleased() {
  if (key == 'w') {
    wPressed = false;
  } else if (key == 's') {
    sPressed = false;
  }
}
