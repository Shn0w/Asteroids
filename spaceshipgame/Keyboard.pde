void keyPressed() {
  if (key== 'w' || key == 'W') {
    w = true;
  }
  if (key== 'a' || key == 'A') {
    a = true;
  }
  if (key== 's' || key == 'S') {
    s = true;
  }
  if (key== 'd' || key == 'D') {
    d = true;
  }
  if (key==' ') {
    space = true;
  }
  if (key == '`') {
    squiggle = true;
  }
}

void mousePressed() {
  mouse = true;
}

void mouseReleased() {
  mouse = false;
}

void keyReleased() {
  if (key== 'w' || key == 'W') {
    w = false;
  }
  if (key== 'a' || key == 'A') {
    a = false;
  }
  if (key== 's' || key == 'S') {
    s = false;
  }
  if (key== 'd' || key == 'D') {
    d = false;
  }
  if (key==' ' || key == ' ') {
    space =false;
  }
  if (key == '`') {
    squiggle = false;
  }
}
