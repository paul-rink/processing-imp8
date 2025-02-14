float angle = 0;

void setup() {
  size(600, 400);
}

void draw() {
  background(240);
  
  // Mittelpunkt des Kreises
  float cx = width / 2;
  float cy = height / 2;
  
  // Berechne Winkel basierend auf Mausposition
  
  angle = atan2(mouseY - cy, mouseX - cx);
  // Kreis zeichnen
  fill(200, 0, 0);
  ellipse(cx, cy, 50, 50);
  
  // Transformation setzen: Ursprung verschieben und rotieren
  pushMatrix();  
  translate(cx, cy);  // Ursprung zum Mittelpunkt des Kreises verschieben
  rotate(angle+3*PI/2);  // Drehen um den Mittelpunkt
  
  // Rechteck zeichnen (zentriert unten)
  fill(0, 100, 255);
  rect(-25, 50, 50, 30);  // x=-25, y=50, um es unten anzuzeigen
  
  popMatrix();  // Transformation zurücksetzen
}
