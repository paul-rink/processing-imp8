int circlePoint;

void setup() {
  size(800,800);
  circlePoint = 200;
}

void draw() {
  background(255);
  if(circlePoint <= 400) {
    fill(0);
  } else {
    fill(255);
  }
  circle(circlePoint, height/2, 150);
}
