class gFowlf {
  // Member Variables
  int x, y, w, health, laserCount, turretCount;
  PImage gff;

  // Constructor
  gFowlf() {
    x = width/2;
    y = height/2;
    w = 100;
    health = 100;
    laserCount = 100;
    turretCount = 1;
    imageMode(CENTER);
    gff = loadImage("gfowl2.png");
  }

  void display() {
    gff.resize(100, 72);
    image(gff, x, y);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(ZachBot b) {
    float d = dist(b.x, b.y, x, y);
    if (d<b.diam) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersectDough(ZachBot b) {
    float d = dist(b.x2, b.y, x, y);
    if (d<b.diam2 && b.randVar < 21) {
      return true;
    } else {
      return false;
    }
  }
}
