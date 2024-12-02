class Laser {
  // Member Variables
  int x, y, w, h, speed;
  PImage lazer;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 15;
    h = 5;
    speed = -6;
    imageMode(CENTER);
    lazer = loadImage("slime1.png");
  }

  void display() {
    lazer.resize(50, 19);
    image(lazer, x, y+10);
    if (gff.turretCount == 2) {
      image(lazer, x, y);
    } else if (gff.turretCount == 3) {
      image(lazer, x, y);
      image(lazer, x, y-10);
    } else if (gff.turretCount == 4) {
      image(lazer, x, y);
      image(lazer, x, y-10);
      image(lazer, x, y-20);
    } else if (gff.turretCount > 4) {
      image(lazer, x, y);
      image(lazer, x, y-10);
      image(lazer, x, y-20);
      image(lazer, x, y+20);
    }
  }

  void move() {
    x = x - speed;
  }

  boolean intersect(ZachBot b) {
    float d = dist(b.x, b.y, x, y);
    if (d < b.diam) {
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


  boolean reachedRight() {
    if (x > width+20) {
      return true;
    } else {
      return false;
    }
  }
}
