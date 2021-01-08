class Asteroid extends GameObject {
  int strokeWeight;
  int actualSize;
  int staticLives;

  public Asteroid() {
    int tmp = Math.round(random(1, 4));
    vel = new PVector(0, 0.7);
    vel.rotate(random(radians(360)));
    size = 140;

    if (tmp ==1) {
      loc = new PVector(-size/2, random(height));
    } else if (tmp==2) {
      loc = new PVector(width + size/2, random(height));
    } else if ( tmp ==3 ) {
      loc = new PVector(random(width), -size/2);
    } else {
      loc = new PVector(random(width), height+size/2);
    }

    lives = 4;
    staticLives = 4;
    strokeWeight = (int)(size*0.15);
    actualSize = size-strokeWeight;
  }

  public Asteroid(int size, int lives, PVector loc, PVector vel) {
    this.lives = lives;
    this.loc = loc.copy();
    this.vel = vel.copy();
    this.vel.setMag(this.vel.mag()+0.5);
    this.vel.rotate(random(radians(50)));
    this.size = size;
    this.staticLives = lives;
    strokeWeight = (int)(size*0.15);
    actualSize = size-strokeWeight;
  }

  void show() {
    fill(255);
    strokeWeight(strokeWeight);
    stroke(100);
    rect(loc.x, loc.y, actualSize, actualSize);
  }

  void act() {
    super.act();
  }
}

void addAsteroid() {
  if (asteroidTimer<=0) {
    objects.add(new Asteroid());
    asteroidTimer = asteroidTime;
  }
  asteroidTimer--;
  if (asteroidTime>50) {
    asteroidTime -= 1.0/25;
  }

  println(asteroidTime);
}
