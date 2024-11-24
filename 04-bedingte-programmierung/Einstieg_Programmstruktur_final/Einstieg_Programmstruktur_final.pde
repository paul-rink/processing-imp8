//Initialisierung aller Spielvariablen
float ballX; 
float ballY;
float ballVx;
float ballVy;
float ballSize;
float playerY;
float playerSize;
int scoreP1;

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
}

void draw() {
  //Logik des Spiels
  ballX = ballX + ballVx;
  ballY = ballY + ballVy;
  
  //Zeichnen des Bilds
  background(0);
  circle(ballX, ballY, ballSize);
  rect(20, playerY, 10, playerSize);
}

//Hilfsfunktionen:
