class Powerup {
  // Member Variables
  int x, y, diam, speed, randVar;
  PImage cpDisc1, cpDisc2, cpDisc3, cpDisc4, cpDisc5;

  // Constructor
  Powerup() {
    x = width+50;
    y = int(random(height));
    diam = int(random(30,70));
    speed = int(random(1, 5));
    randVar = int(random(5));
    cpDisc1 = loadImage("disc1.png");
    cpDisc2 = loadImage("disc6.png");
    cpDisc3 = loadImage("disc3.png");
    cpDisc4 = loadImage("disc4.png");
    cpDisc5 = loadImage("disc5.png");
  }

  void display() {
    fill(240, 222, 131, 30);
    ellipse(x,y,diam,diam);
    cpDisc1.resize(diam, diam);
    cpDisc2.resize(diam, diam);
    cpDisc3.resize(diam, diam);
    cpDisc4.resize(diam, diam);
    cpDisc5.resize(diam, diam);
    if(randVar < 1) {
      image(cpDisc1, x, y);
    } else if(randVar < 2) {
      image(cpDisc2, x, y);
    } else if(randVar < 3) {
      image(cpDisc3, x, y);
    } else if(randVar < 4) {
      image(cpDisc4, x, y);
    } else {
      image(cpDisc5, x, y);
    }
  }

  void move() {
    x = x - speed;
  }

  boolean reachedLeft() {
    if (x < -50) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(gFowlf gff) {
    float d = dist(x, y, gff.x, gff.y);
    if (d < 50) {
      return true;
    } else {
      return false;
    }
  }
}
