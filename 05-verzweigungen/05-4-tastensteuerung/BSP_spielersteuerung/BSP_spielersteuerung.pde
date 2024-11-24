boolean qPressed;
boolean wPressed;
int ypos;

void setup() {
  size(400,400);
  qPressed = false;
  wPressed = false;
  ypos = height/2-25;
}

void draw() {
  if(qPressed) {
    ypos += 1;
  }
  if (wPressed) {
    ypos -= 1;
  }
  background(0);
  rect(20,ypos,20,50);
}

void keyPressed() {
  if(key == 'q') {
    qPressed = true;
  } else if(key == 'w') {
    wPressed = true;
  }
}

void keyReleased() {
  if(key == 'q') {
    qPressed = false;
  } else if(key == 'w') {
    wPressed = false;
  }
}
