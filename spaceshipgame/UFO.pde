class UFO extends GameObject {

  int attackSpeed;

  public UFO() {
    int tmp = Math.round(random(1, 4));
    vel = new PVector(0, 1);
    vel.rotate(random(radians(360)));
    vel.setMag(3);
    size = 60;
    lives = 1;

    if (tmp ==1) {
      loc = new PVector(-size/2, random(height));
    } else if (tmp==2) {
      loc = new PVector(width + size/2, random(height));
    } else if ( tmp ==3 ) {
      loc = new PVector(random(width), -size/2);
    } else {
      loc = new PVector(random(width), height+size/2);
    }
  }

  void show() {
    fill(180, 0, 0);
    strokeWeight(0);
    circle(loc.x, loc.y, size);
    strokeWeight(3);
    stroke(0);
    circle(loc.x, loc.y, size-30);
  }

  void act() {    
    if (attackSpeed<=0) {
      attackSpeed = 90;
      shoot();
    } else {
      attackSpeed--;
    }
    loopAround();
    super.act();
  }

  void shoot() {
    objects.add(new Bullet(true, loc, new PVector(myShip.loc.x - loc.x, myShip.loc.y-loc.y)));
  }
}

void addUFO() {
  if (spawn==0) {
    objects.add(new UFO());
    spawn = 900;
  } else {
    spawn--;
  }
}
