boolean qPressed;
boolean wPressed;
boolean ePressed;
int r;
int g;
int b;
void setup() {
  size(400,400);
  qPressed = false;
  wPressed = false;
  ePressed = false;
  r = 0;
  g = 0;
  b = 0;
}

void draw() {
  r = 0;
  g = 0;
  b = 0;
  if(qPressed) {
    r = 255;
  }
  if (wPressed) {
    g = 255;
  }
  if (ePressed) {
    b = 255;
  }
  background(r,g,b);
}

void keyPressed() {
  if(key == 'q') {
    qPressed = true;
  } else if(key == 'w') {
    wPressed = true;
  } else if(key == 'e') {
    ePressed = true;
  }
}

void keyReleased() {
  if(key == 'q') {
    qPressed = false;
  } else if(key == 'w') {
    wPressed = false;
  } else if(key == 'e') {
    ePressed = false;
  }
}
