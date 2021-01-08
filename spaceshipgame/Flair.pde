class Flair extends GameObject {
  PVector dir;
  float time;

  Flair(boolean forward) {
    size = 3;
    dir = myShip.dir.copy();
    loc = myShip.loc.copy();

    if (forward) {
      dir.rotate(radians(random(40)+150));
    } else {
      dir.rotate(radians(random(40)-20));
    }
    vel = dir.copy();
    time = 45;
    lives = 1;
    vel.setMag(30);
    loc.add(vel);
    vel.setMag(5);
  }
  void show() {
    strokeWeight(0);
    fill(255);
    circle(loc.x, loc.y, size);
  }

  void act() {
    super.act();
    if (time==0) {
      lives=0;
    } else {
      time--;
    }
  }
}

float flairTime;

void addFlair() {
  if (flairTime<=0) {
    if (w) {
      objects.add(new Flair(true));
    } else if (s) {
      objects.add(new Flair(false));
    }
    flairTime = 2;
  }
  flairTime--;
}
