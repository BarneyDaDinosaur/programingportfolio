//William Barney || Conversion App || Sep 23 2024

void setup() {
  size(400,200);
}

void draw() {
  background(234);
  textSize(30);
  text("Temp Converter: \n by William Barney", width/2, 25);
  textSize(10);
  stroke(201, 18, 18);
  line(0, 150, width, 150);
  for(int i=0; i<width; i+=25) {
    line(i, 145, i, 155);
    textAlign(CENTER);
    fill(0);
    if(i < width/2) {
      text("-" + (width/2 - i), i, 140);
      } else {
      text(i - width/2, i, 140);
      }
  }
  ellipse(mouseX, 150, 8, 8);
  text(mouseX-200, mouseX, 170);
  
  text("Cel: " + farToCel(mouseX-200), width/2, 100);
  text("Far: " + celToFar(mouseX-200), width/2, 75);
}

float farToCel(float tempFar) {
  tempFar = (tempFar-32)*(5.0/9.0);
  return tempFar;
}

float celToFar(float tempCel) {
  tempCel = (tempCel*(9.0/5.0))+32;
  return tempCel;
}
