//Initialisierung aller Spielvariablen
int numBalls;
float[] ballX; 
float[] ballY;
float[] ballVx;
float[] ballVy;
float[] ballSize;


//Aufbau des Spiels / Festlegung aller Spielparameter
void setup() {
  size(800,400);
  numBalls = 2;
  ballX = new float[numBalls]; 
  ballY = new float[numBalls];
  ballVx = new float[numBalls];
  ballVy = new float[numBalls];
  ballSize = new float[numBalls];
  int z = 0;
  while(z < numBalls) {
    ballX[z] = width/2;
    ballY[z] = height/2;
    ballVx[z] = random(-2,2);
    ballVy[z] = random(-2,2);
    ballSize[z] = 50;
    z = z + 1;
  }
  
}

void draw() {
  //Logik des Spiels
  int z = 0;
  while(z < numBalls) {//Schleife um alle Bälle bewegen zu lassen
    ballX[z] = ballX[z] + ballVx[z];
    ballY[z] = ballY[z] + ballVy[z];
    z = z + 1;
  } 
  //Zeichnen des Bilds
  background(0);
  z = 0;
  while(z < numBalls) {//Schleife um alle Bälle zu zeichnen
    circle(ballX[z], ballY[z], ballSize[z]);
    z = z + 1;
  } 
}

//Hilfsfunktionen:
