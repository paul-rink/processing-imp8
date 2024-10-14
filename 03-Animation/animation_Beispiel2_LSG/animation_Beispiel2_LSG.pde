float posX;
float posY;

void setup() {
  size(450,450);
  posX = 0;
  posY = height/2;
}

void draw() {
  background(255);
  circle(posX, posY, 50);
  posX = posX + 5;
  posY = posY - 2;
}
