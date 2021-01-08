class Particle extends GameObject {
  int transparent;

  public Particle(PVector loc) {
    this.loc = loc.copy();
    vel = new PVector(1, 0);
    vel.rotate(random(radians(360)));
    vel.setMag(1.8);
    particleTime = 120   ;
    size = 10;
    lives = 1;
    transparent = 255;
  }

  void show() {
    strokeWeight(0);
    fill(transparent);
    rect(loc.x, loc.y, size, size);
  }

  void act() {
    super.act();
    if (transparent<=10) {
      lives = 0;
    } else {
      transparent-=4;
    }
  }
}
