int circlePoint;

void setup() {
  size(800,800);
  circlePoint = 200;//Verändere die Position des Kreises und teste wie sich das Bild verändert.
}

void draw() {
  background(255);
  if(circlePoint < 400) {
    fill(0);
  } else {
    fill(255);
  }
  circle(circlePoint, height/2, 150);
}
