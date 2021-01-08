class Spaceship extends GameObject {
  //1. Instance Variables or Field
  PVector dir;
  float friction;
  float maxVel;
  float invincible;

  //Construcuter
  Spaceship() {
    loc = new PVector(width/2, height/2);
    dir = new PVector(0.15, 0);
    vel = new PVector(0, 0);
    size = 25;
    lives = 3;
    friction = 0.015;
    maxVel = 5;
  }

  // behaviour functions
  void show() {
    pushMatrix();
    strokeWeight(2.5);
    if (invincible>0) {
      stroke(255, 0, 0);
    } else {
      stroke(255);
    }
    fill(0);
    translate(loc.x, loc.y);
    rotate(dir.heading());
    triangle(-size, -size*3/5, size, 0, -size, size*3/5);

    rect(0, 0, size*2-2, 0);
    popMatrix();
  } 

  void doFriction() {
    if (vel.x>0) vel.sub(friction, 0);
    if (vel.x<0)vel.add(friction, 0);
    if (vel.y>0)vel.sub(0, friction);
    if (vel.y<0)vel.add(0, friction);
  }

  void act() {
    for (int i=0; i<objects.size(); i++) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y)<=obj.size/2 + size && invincible<=0) {
          lives--;
          invincible = 180;
          if (lives<=0) {
            mode = LOSE;
          }
        }
      } else if (obj instanceof Bullet && ((Bullet)(obj)).enemy && dist(obj.loc.x, obj.loc.y, loc.x, loc.y) <= obj.size/2 + size && invincible<=0) {
        lives--;
        obj.lives = 0;
        invincible = 180;
        if (lives<=0) {
          mode = LOSE;
        }
      }
    }
    if (invincible>0) {
      invincible--;
    }

    if (a) dir.rotate(radians(-4));
    if (d) dir.rotate(radians(4));  
    if (w) vel.add(dir);
    if (s) vel.sub(dir);
    if (vel.mag()>maxVel) {
      if (w) vel.sub(dir);
      if (s) vel.add(dir);
    }
    loc.add(vel);
    doFriction();

    if (loc.x-5.0/6*size>width) loc.x = -5.0/6*size;
    if (loc.x<-5.0/6*size) loc.x = width+5.0/6*size;
    if (loc.y-5.0/6*size>height) loc.y = -5.0/6*size;
    if (loc.y<-5.0/6*size) loc.y = height+5.0/6*size;
  }
}
