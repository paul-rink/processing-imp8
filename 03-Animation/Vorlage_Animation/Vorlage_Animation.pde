float posX;
float posY;

void setup() {
  size(450,450);
  posX = 0;
  posY = height/2;
}

void draw() {
  circle(posX, posY, 50);
  posX =0; // Verändere diese Zeile, dass der Ball nach rechts wandert.
  //Ergänze das Programm, so dass der Ball sich auch in Y-Richtung bewegt.
}
