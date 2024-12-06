//Initialisierung aller Spielvariablen
float ball1X; 
float ball1Y;
float ball1Vx;
float ball1Vy;
float ball1Size;
float ball2X; 
float ball2Y;
float ball2Vx;
float ball2Vy;
float ball2Size;


//Aufbau des Spiels / Festlegung aller Spielparameter
void setup() {
  size(800,400);
  ball1X = width/2;
  ball1Y = height/2;
  ball1Vx = 4;
  ball1Vy = 2;
  ball1Size = 50;
  ball2X = width/2;
  ball2Y = height/2;
  ball2Vx = 2;
  ball2Vy = 4;
  ball2Size = 50;
}

void draw() {
  //Logik des Spiels
  ball1X = ball1X + ball1Vx;
  ball1Y = ball1Y + ball1Vy;
  ball2X = ball2X + ball2Vx;
  ball2Y = ball2Y + ball2Vy;  
  //Zeichnen des Bilds
  background(0);
  circle(ball1X, ball1Y, ball1Size);
  circle(ball2X, ball2Y, ball2Size);
}

//Hilfsfunktionen:
