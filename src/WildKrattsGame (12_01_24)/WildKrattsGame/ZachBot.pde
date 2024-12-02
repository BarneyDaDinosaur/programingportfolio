class ZachBot {
  // Member Variables
  int x, y, x2, diam, diam2, speed, randVar;
  PImage zBot, dBlast, dBall, manquin;

  // Constructor
  ZachBot() {
    x = width+50;
    y = int(random(height));
    x2 = width+50;
    diam = int(random(30, 70));
    diam2 = diam - 15;
    speed = int(random(1, 5));
    randVar = int(random(1, 100));
    zBot = loadImage("zbot1.png");
    dBlast = loadImage("doughBlaster1.png");
    dBall = loadImage("doughball1.png");
    manquin = loadImage("mannequin1.png");
  }

  void display() {
    zBot.resize(diam, diam);
    dBlast.resize(diam, diam);
    manquin.resize(diam, diam);
    dBall.resize(diam2, diam2);
    if (randVar < 21) {
      image(dBlast, x, y);
      image(dBall, x2, y);
    } else if (randVar < 41) {
      image(manquin, x, y);
    } else {
      image(zBot, x, y);
    }
  }

  void move() {
    x = x - speed;
    x2 = x2 - (speed * 2);
  }

  boolean reachedLeft() {
    if (x < -50) {
      return true;
    } else {
      return false;
    }
  }
}
