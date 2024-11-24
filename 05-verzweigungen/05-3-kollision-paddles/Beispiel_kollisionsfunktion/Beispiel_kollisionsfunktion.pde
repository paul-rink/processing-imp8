float ballX;// x-Position des Balls
float ballY;// y-Position des Balls
float ballSize;// Durchmesser des Balls
float playerX;// x-Position des Spielers
float playerY;// y-Position des Spielers
float playerW;// Breite des Spielers
float playerH;// Höhe des Spielers

void setup() {
  size(400,400);
  //Starteinstellungen des Beispiels
  ballX = width / 2;
  ballY = height / 2;
  ballSize = 50;
  playerW = 10;
  playerH = 100;
  playerX = 20;
  playerY = height / 2 - playerH/2;
}

void draw() {
  //Überprüfung, ob der Ball den Spieler berührt
  if(circRectColl(ballX, ballY, ballSize, playerX, playerY, playerW, playerH)) {//Hier wird die Funktion circRectColl aufgreufen. Wenn die beiden sich berühren wird true geantwortet. Wenn nicht false.
    background(0,255,0);// Wenn ja, Hintergrund grün
  } else {
    background(255,0,0);// Wenn nein, Hintergrund rot
  }
  
  ballX = ballX - 1;// Der Ball bewegt sich nach Rechts auf den Spieler zu, damit er ih irgendwann berührt 
  //Malen des Bilds:
  circle(ballX, ballY, ballSize);
  rect(playerX, playerY, playerW, playerH);
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
