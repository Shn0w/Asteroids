class GameObject {
  PVector loc;
  PVector vel;
  int lives;
  int size;

  void GameObject() {
  }

  void show() {
    stroke(255);
    fill(0);
  }

  void act() {
    loc.add(vel);
  }

  void loopAround() {
    if (loc.x-size/2>width) loc.x = -size/2;
    if (loc.x<-size/2) loc.x = width+size/2;
    if (loc.y-size/2>height) loc.y = -size/2;
    if (loc.y<-size/2) loc.y = height+size/2;
  }
}

boolean offScreen(PVector loc, int size) {
  if (loc.x+size>width || loc.x<-size || loc.y +size>height || loc.y<-size) {
    return true;
  }
  return false;
}

void move() {
  for (int i = 0; i<objects.size(); i++) {
    GameObject obj = objects.get(i);
    if (obj instanceof Bullet) {
      for (int j = 0; j<objects.size(); j++) {
        GameObject tmp = objects.get(j);
        if (dist(obj.loc.x, obj.loc.y, tmp.loc.x, tmp.loc.y) < obj.size + tmp.size) {
          if ((tmp instanceof Asteroid)) {
            obj.lives = 0;
            tmp.lives--;
            if (tmp.lives==0) {
              score++;
            }
          } else if ((tmp instanceof UFO) && !((Bullet)(obj)).enemy) {
            score+=5;
            for (int k=0; k<6; k++) {
              objects.add(new Particle(tmp.loc));
            }
            obj.lives = 0;
            tmp.lives--;
          } else if ((tmp instanceof Bullet) && ((Bullet)(obj)).enemy!=((Bullet)(tmp)).enemy) {
            obj.lives = 0;
            tmp.lives = 0;
          }
        }
      }
      if (offScreen(obj.loc, obj.size)) {
        obj.lives = 0;
      }
    } else if (obj instanceof Asteroid) {
      obj.loopAround();
    } else if (obj instanceof Flair) {
      if (((Flair)obj).time<=0) {
        obj.lives = 0;
      }
    }
    if (obj.lives<=0) {
      if (obj instanceof Asteroid) {
        for (int j=0; j<5; j++) {
          objects.add(new Particle(obj.loc));
        }
        if (obj.size>50) {
          int tmp = Math.max(((Asteroid)obj).staticLives-1, 1);
          objects.add(new Asteroid(obj.size-30, tmp, obj.loc, obj.vel));
          objects.add(new Asteroid(obj.size-30, tmp, obj.loc, obj.vel));
        }
      }
      objects.remove(i);
      i--;
    }
    obj.show();
    obj.act();
  }
}    
