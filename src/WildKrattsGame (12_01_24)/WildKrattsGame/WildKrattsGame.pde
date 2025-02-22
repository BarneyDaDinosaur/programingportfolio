//William Barney | Nov 6 2024| Spaceship Game
int score, time, level, health, totalTime;
boolean play;
gFowlf gff;
ArrayList<ZachBot> bots = new ArrayList<ZachBot>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer bTime, b2Time, b3Time, b4Time, b5Time, puTime, dbTime, slowTime;
PImage infoPanel;
import processing.sound.*;
boolean slow_down;
SoundFile squak, squirt;

void setup() {
//Game settings and initialisers
  size(500, 500);
  bTime = new Timer(2400);
  b2Time = new Timer(4800);
  b3Time = new Timer(4800);
  b4Time = new Timer(4800);
  b5Time = new Timer(4800);
  bTime.start();
  slowTime = new Timer(30000);
  puTime = new Timer(15000); //offical: 15000
  puTime.start();
  squak = new SoundFile(this, "gff_squak2.wav");
  squirt = new SoundFile(this, "squirt2.wav");
  squirt.amp(0.25);
  squak.amp(0);
  squak.loop();
  level = 1;
  play = false;
}

void draw() {
//Screen set up
  loop();
  if (play == false) {
    startScreen();
  }

  if (play == true) {
//In game code
 //During play settings
    squak.amp(1);
    textAlign(LEFT);
    strokeWeight(1);
    noCursor();
    background(96, 161, 216);

 //Adding and removing raindrops
    stars.add(new Star());
    for (int i = 0; i < stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }

 //Second counter
    if (frameCount % 60  == 0) {
      time++;
    }

 //Disables Powerup look of the ship
    if (frameCount % 360  == 0) {
      gff.gff = loadImage("gfowl2.png");
    }

 //Health regeneration timer
    if (frameCount % 180  == 0) {
      if (gff.health < 100) {
        gff.health++;
      }
  //Ammo regeneration timer
      if (gff.laserCount < 100) {
        gff.laserCount ++;
      }
    }

 //Stops the slow down powerup effect
    if (slowTime.isFinished()) {
      slow_down = false;
    }

 //Laser/ammo code
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j<bots.size(); j++) {
        ZachBot b = bots.get(j);
 //Removing or shrinking enemy bot is a laser hits it
        if (laser.intersect(b)) {
          score += 15;
          lasers.remove(laser);
          b.diam-=random(35, 30);
          if (b.diam<10) {
            bots.remove(b);
          }
        }
      }
      laser.display();
      laser.move();
 //Removes laser if it goes off of the screen
      if (laser.reachedRight()) {
        lasers.remove(laser);
      }
    }

//Main enemy bot code
    for (int i = 0; i < bots.size(); i++) {
      ZachBot bot = bots.get(i);
      bot.display();
      bot.move();
 //Applies slow down power up
      if (slow_down) {
        bot.speed = 2;
      }
 //Damages and reduces the score of the player if it touches a bot
      if (gff.intersect(bot)) {
        gff.health -= (0.5*bot.diam);
        bots.remove(bot);
        score -= bot.diam;
      }
 //Damages and lowers score of the player if a doughball touches the player
      if (gff.intersectDough(bot)) {
        gff.health -= (0.5*bot.diam2);
        bots.remove(bot);
        score -= bot.diam2;
      }
 //Reduces score and remives bot if is crosses all of the screen
      if (bot.reachedLeft()) {
        bots.remove(bot);
        gff.health -= 50;
        background(242, 137, 137, 5);
      }
    }

    //Powerup Logic
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }

    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(gff)) {//upgrades based on randVar
 //Changes the look of the player's ship
        gff.gff = loadImage("gfowlPow2.gif");
 //Applies different effects of the player depending on RandVar
        if (pu.randVar < 1) {
          gff.laserCount += 75;
        } else if (pu.randVar < 2) {
          if (gff.health < 100) {
            gff.health += 75;
          }
        } else if (pu.randVar < 3) {
          gff.turretCount += 1;
        } else if (pu.randVar < 4) {
          squirt.amp(0.5);
          squirt.play();
          for (int j=0; j<height; j+=25) {
            lasers.add(new Laser(-10, j));
          }
        } else {
          slow_down = true;
          slowTime.start();
        }
        powups.remove(pu);
      }
 //Removes powerup disc if it crosses the screen
      if (pu.reachedLeft()) {
        powups.remove(pu);
      }
    }
    //end of powerup stuff

//Moves the main player's ship
    gff.display();
    gff.move(mouseX, mouseY);

 //Adds new bots in a timer
    if (bTime.isFinished()) {
      bots.add(new ZachBot());
      bTime.start();
    }

 //Increases level and the number of bots spawning based on score
    if (score > 500) {
      level = 2;
      if (b2Time.isFinished()) {
        bots.add(new ZachBot());
        b2Time.start();
      }
    }
    if (score > 1000) {
      level = 3;
      if (b3Time.isFinished()) {
        bots.add(new ZachBot());
        b3Time.start();
      }
    }
    if (score > 1500) {
      level = 4;
      if (b4Time.isFinished()) {
        bots.add(new ZachBot());
        b4Time.start();
      }
    }
    if (score > 2000) {
      level = 5;
      if (b5Time.isFinished()) {
        bots.add(new ZachBot());
        b5Time.start();
      }
    }

    if (score > 2500) {
      for (int i = 2500; i > 0; i += 500) {
        if (score > i) {
          level += 1;
        }
      }
    }

 //Updates info panel
    infoPanel();

 //Initiates Game Over Screen
    if (gff.health<=0) {
      gameOver();
    }
  }
}

//Fires ammo
void keyPressed() {
  if (keyPressed && key == ' ' && gff.fire()) {
    squirt.amp(0.5);
    squirt.play();
    lasers.add(new Laser(gff.x, gff.y));
    gff.laserCount --;
  }
}

//Info Panel display
void infoPanel() {
  infoPanel = loadImage("infoPanel1.png");
  infoPanel.resize(250, 140);
  image(infoPanel, 375, 450);
  fill(255);
  textSize(15);
  text("Score:" + score, 322, 440);
  text("Time:" + time, 315, 461);
  text("Ammo:" + gff.laserCount, 330, 451);
  text("Health:" + gff.health, 335, 430);
  text("Level:" + level, 332, 471);
}

//Start screen code
void startScreen() {
  cursor();
  background(118);
  fill(234, 228, 38);
  textAlign(CENTER);
  textSize(50);
  strokeWeight(4);
  text("Press PLAY\n to Start", width/2, height/2);
  textAlign(LEFT);
  strokeWeight(2);
  textSize(20);
  text("You are in the Guinea Fowl Flapper \n Press Spacebar to shoot slime from the sliminator \n Avoid Zachbots/Dough Shooter/Mannequin Robots \n Creature Power Discs offer powerups \n Right-click to see this screen at any point \n If the sound is annoything you, \n      you can mute your own computer", 10, 20);
}

//Game over screen
void gameOver() {
  play = false;
  slow_down = false;
  background(98);
  cursor();
  noLoop();
  powups.remove(powups);
  lasers.remove(lasers);
  bots.remove(bots);
  textSize(40);
  text("Game Over", width/2, 50);
  text("Score:" + score, width/2, 100);
  text("Time:" + time, width/2, 150);
  text("Level:" + level, width/2, 200);
  textAlign(LEFT, TOP);
  textSize(22);
  text("Play Again?", 260, 215);
  text("Play Again?", 260, 235);

  level = 1;
  score = 0;
  time = 0;
  health = 100;
  gff.laserCount = 100;
}

void ticker() {
}

//If PLAY is pressed, the game starts
void mousePressed() {
  if (mouseX > 260 && mouseX < 365 && mouseY > 215 && mouseY < 250) {
    play =  true;
    redraw();
    gff = new gFowlf();
  } else {
    play = false;
  }
}
