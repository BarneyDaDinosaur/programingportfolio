// William Barney | Timeline Assignment | Aug 28, 2024

void setup() {
  size(900, 400);
  background(80, 117, 94);
}

void draw() {
  background(80, 117, 94);
  drawRef();
  histEvent(105, 200, "Z2 - 1940", "Germany: earliest examples of an electric operated digital computer built with electromechanical relays", true);
  histEvent(300, 200, "The TUBE", "DETAIILLLS3", true);
  histEvent(450, 200, "ERA 1101 - 1950", "Details are Cool5", true);
  histEvent(600, 200, "Test 7", "Details are enthrawling7", true);
  histEvent(200, 300, "ENIAC - 1945", "US: the first electronic programmable computer built in the US", false);
  histEvent(350, 300, "Test 4", "Details 4", false);
  histEvent(500, 300, "Test 6", "Details 6", false);
  histEvent(650, 300, "Test 8", "Details 8", false);
}

void drawRef() {
  //timeline stuff
  strokeWeight(3);
  stroke(102, 16, 90);
  line(100, 250, 800, 250);
  fill(209, 141, 10);
  textAlign(CENTER, CENTER);
  textSize(18);
  text("1940", 100, 270);
  text("1960", 800, 270);

  //title text
  textSize(70);
  textAlign(CENTER, CENTER);
  text("Historic Computer Systems", width/2, 35);
  textSize(30);
  text("by: William Barney", width/2, 90);
}

void histEvent(int x, int y, String val, String detail, boolean top) {
  if (top) {
    strokeWeight(2);
    line(x, y, x+10, y+50);
  } else {
    line(x, y, x+10, y-50);
  }
  rectMode(CENTER);
  fill(168, 118, 89);
  rect(x, y, 80, 20);
  fill(20);
  textSize(15);
  text(val, x, y);

  if (mouseX>x-40  &&  mouseX<x+40 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
