float posXPlayer;
float posYPlayer;
float posXBullet;
float posYBullet;
float vXBullet;
float vYBullet;
float vMod;
boolean gravity;
boolean shot;

void setup() {
  size(800,400);
  posXPlayer = width/2;
  posYPlayer = height-25;
  posXBullet = posXPlayer;
  posYBullet = posYPlayer;
  vXBullet = 0;
  vYBullet = 0;
  vMod = 15;
  gravity = true;
  shot = false;
}

void draw() {
  //Move Bullet
  posXBullet = posXBullet + vXBullet * vMod;
  posYBullet = posYBullet + vYBullet * vMod;
  if(gravity && shot) {
    vYBullet = vYBullet + 0.035;
  }
  if(posXBullet > width || posXBullet < 0 || posYBullet > height || posYBullet < 0) {
    vXBullet = 0;
    vYBullet = 0;
    posXBullet = posXPlayer;
    posYBullet = posYPlayer;
    shot = false;
  }
  background(0);
  circle(posXPlayer, posYPlayer, 100);
  circle(posXBullet, posYBullet, 10);
}

void mouseClicked() {
  setBulletDir();
  
}

void setBulletDir() {
  float xDifference = mouseX - posXBullet;
  float yDifference = mouseY - posYBullet;
  float dist = sqrt(xDifference*xDifference + yDifference*yDifference);
  vMod = dist / 15;
  vXBullet = xDifference / dist;
  vYBullet = yDifference / dist;
  shot = true;
  
}
