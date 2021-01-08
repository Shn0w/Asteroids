class Bullet extends GameObject {

  boolean enemy;

  Bullet(boolean enemy, PVector loc, PVector vel) {
    this.loc = loc.copy();
    this.vel = vel.copy();
    PVector tmp = vel.copy();
    tmp.setMag(35);
    this.loc.add(tmp);
    this.enemy = enemy;
    if (enemy) {
      this.vel.setMag(12);
    } else {
      this.vel.setMag(20);
    }
    lives = 1;
    size = 7;
  }

  void show() {
    super.show();
    fill(255);
    strokeWeight(1);
    circle(loc.x, loc.y, size);
  }

  void act() {
    for (int i = 0; i<objects.size(); i++) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid) {
      }
    }
    super.act();
  }
}
void addBullets() {
  if ((space || mouse) && actual<=0) {
    objects.add(new Bullet(false, myShip.loc, myShip.dir));
    actual = 12;
  }
  if (actual>0) {
    actual-=2;
  }
}
