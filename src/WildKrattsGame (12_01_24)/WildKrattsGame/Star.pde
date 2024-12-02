class Star {
  // Member Variables
  int x, y, diam, speed;

  // Constructor
  Star() {
    this.x = int(random(width));
    this.y = -10;
    diam = 3;
    speed = 3;
  }

  void display() {
    noStroke();
    fill(145, 190, 224);
    ellipse(x, y, diam, diam+1);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height + 10) {
      return true;
    } else {
      return false;
    }
  }
}
