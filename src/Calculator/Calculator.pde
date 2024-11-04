// William Barney | Calculator | 2 Oct 2024
Button[] buttons = new Button[23];
String dVal = "0";  // display value
char op;
float l, r, result;
boolean left;

void setup() {
  size(360, 450);
  background(80);
  op = ' ';
  l = 0.0;
  r = 0.0;
  result = 0.0;
  left = true;
  buttons[0] = new Button(80, 405, 127, 60, "0", 180, true);
  buttons[1] = new Button(45, 338, 60, 60, "1", 180, true);
  buttons[2] = new Button(112, 338, 60, 60, "2", 180, true);
  buttons[3] = new Button(180, 338, 60, 60, "3", 180, true);
  buttons[4] = new Button(45, 270, 60, 60, "4", 180, true);
  buttons[5] = new Button(112, 270, 60, 60, "5", 180, true);
  buttons[6] = new Button(180, 270, 60, 60, "6", 180, true);
  buttons[7] = new Button(45, 202, 60, 60, "7", 180, true);
  buttons[8] = new Button(112, 202, 60, 60, "8", 180, true);
  buttons[9] = new Button(180, 202, 60, 60, "9", 180, true);
  buttons[10] = new Button(180, 405, 60, 60, ".", 180, false);
  buttons[11] = new Button(248, 405, 60, 60, "+", #F09D18, false);
  buttons[12] = new Button(248, 338, 60, 60, "-", #F09D18, false);
  buttons[13] = new Button(248, 270, 60, 60, "*", #F09D18, false);
  buttons[14] = new Button(248, 202, 60, 60, "÷", #F09D18, false);
  buttons[15] = new Button(315, 370, 60, 127, "=", #F09D18, false);
  buttons[16] = new Button(45, 135, 60, 60, "C", #528E4A, false);
  buttons[17] = new Button(112, 135, 60, 60, "Del", #528E4A, false);
  buttons[18] = new Button(180, 135, 60, 60, "±", #528E4A, false);
  buttons[19] = new Button(248, 135, 60, 60, "^", #528E4A, false);
  buttons[20] = new Button(315, 135, 60, 60, "√", #528E4A, false);
  buttons[21] = new Button(315, 202, 60, 60, "π", #528E4A, false);
  buttons[22] = new Button(315, 270, 60, 60, "sin", #528E4A, false);
}

void draw() {
  background(80);
  // println("Left:" + l  + " Op:" + op + " Right:" + r + " Result:" + result);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  fill(230);
  rect(width/2, 55, 330, 75, 15);
  fill(0);
  if (dVal.length() < 13) {
    textSize(50);
  } else if (dVal.length() < 15) {
    textSize(44);
  } else if (dVal.length() < 17) {
    textSize(39);
  } else if (dVal.length() < 19) {
    textSize(35);
  }
  textAlign(RIGHT);
  text(dVal, width-30, 80);
}

void mousePressed() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length() < 21) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        l = float(dVal);
      } else {
        dVal += buttons[i].val;
        l = float(dVal);
      }
    } else if (buttons[i].on && buttons[i].isNum && !left && dVal.length() < 21) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        r = float(dVal);
      } else {
        dVal += buttons[i].val;
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+")) {
      dVal = "0";
      op = '+';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("-")) {
      dVal = "0";
      op = '-';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("*")) {
      dVal = "0";
      op = '*';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("÷")) {
      dVal = "0";
      op = '/';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("C")) {
      op = ' ';
      l = 0.0;
      r = 0.0;
      result = 0.0;
      left = true;
      dVal = "0";
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("=")) {
      preformCalc();
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        dVal = str(PI);
        l = PI;
      } else {
        dVal = str(PI);
        r = PI;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("sin")) {
      if (left) {
        dVal = str(sin(l));
        l = float(dVal);
      } else {
        dVal = str(sin(r));
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      if (left) {
        dVal = str(sqrt(l));
        l = float(dVal);
      } else {
        dVal = str(sqrt(r));
        r = float(dVal);
      }
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("^")) {
      dVal = "0";
      op = '^';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("Del") && dVal.length() >= 1) {
      if (left) {
        dVal = dVal.substring(0, dVal.length() -1);
        l = float(dVal);
      } else {
        dVal = dVal.substring(0, dVal.length() -1);
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("±")) {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal = str(r);
      }
    }
  }
}


void preformCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  } else if (op == '^') {
    result = pow(l, r);
  }
  dVal = str(result);
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length() < 21 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
      l = float(dVal);
    } else {
      dVal += keyVal;
      l = float(dVal);
    }
    l = float(dVal);
  } else if (!left && dVal.length() < 21 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
      r = float(dVal);
    } else {
      dVal += keyVal;
      r = float(dVal);
    }
  } else if (keyVal.equals(".")) {
    if (!dVal.contains(".") && left) {
      dVal += ".";
      l = float(dVal);
    } else if (!dVal.contains(".") && !left) {
      dVal += ".";
      l = float(dVal);
    }
  } else if (keyVal.equals("+")) {
    if (!dVal.contains("+") && left) {
      dVal = "0";
      op = '+';
      left = false;
    }
  } else if (keyVal.equals("/")) {
    if (!dVal.contains("/") && left) {
      dVal = "0";
      op = '/';
      left = false;
    }
  } else if (keyVal.equals("*")) {
    if (!dVal.contains("*") && left) {
      dVal = "0";
      op = '*';
      left = false;
    }
  } else if (keyVal.equals("-")) {
    if (!dVal.contains("-") && left) {
      dVal = "0";
      op = '-';
      left = false;
    }
  } else if (keyVal.equals("=")) {
    if (!dVal.contains("=") && !left) {
      preformCalc();
    }
  }
}


void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else if (key == '=' || keyCode == 10) {
    handleEvent("=", false);
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 109) {
    handleEvent("-", false);
  } else if (key == '*' || keyCode == 106) {
    handleEvent("*", false);
  } else if (key == '/' || keyCode == 111) {
    handleEvent("/", false);
  } else if (key == '.' || keyCode == 110) {
    handleEvent(".", false);
  }
}
