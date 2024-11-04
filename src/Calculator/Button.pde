class Button {
  // Member Variables
  int w, h, x, y;
  color c1, c2;
  String val;
  boolean on, isNum;

  // Constructor
  Button(int x, int y, int w, int h, String val, color c1, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c1 = c1;
    c2 = color(c1,90);
    this.val = val;
    on=false;
    this.isNum = isNum;
  }

  // Member Methods
  void display() {
    if (on == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    textSize(30);
    rect(x, y, w, h, 15);
    fill(0);
    textAlign(CENTER, CENTER);
    text(val, x, y);
  }

  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
