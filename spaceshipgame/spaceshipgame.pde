int mode;
final int START = 0;
final int GAME = 1;
final int LOSE = 2;
final int PAUSE = 3;
final int HIGHSCORE=4;

Spaceship myShip;
Asteroid asteroid;
ArrayList<GameObject> objects;
boolean w;
boolean a;
boolean s;
boolean d;
boolean space;
boolean mouse;
boolean squiggle;
float particleTime;
float actual;
float asteroidTimer;
float asteroidTime;
int score;
int spawn;
int highScore;

void setup() {
  size(1920, 1080);
  rectMode(CENTER);  
  mode = START;
  objects = new ArrayList();  particleTime = 10;
  actual = 0;
  highScore = -1;
  asteroidTime = 450;
}

void draw() {
  if (mode == START) {
    background(0);
    addAsteroid();
    move();
    Button start = new Button(width/2, height/2+200, 400, 150, 0, 0, 255, "START", 100, 0);
    start.show();
    if (start.mouseClick()) {
      score = 0;
      mouse = false;
      objects = new ArrayList();
      mode = GAME;
      asteroidTimer = 100;
      myShip = new Spaceship();
      spawn = 900;
      asteroidTime = 240;
      asteroidTimer = 0;
    }
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(100);
    text("ASTEROIDS", width/2, height/2-200);
    if (highScore!=-1) {
      Button high = new Button(width/2, height/2, 0, 0, 0, 0, 255, "CURRENT HIGHSCORE: " + highScore, 50, 255);
      high.show();
    }
  } else if (mode == GAME) {
    background(0);
    if (squiggle) {
      squiggle = false;
      mode = PAUSE;
    }
    myShip.show();
    myShip.act();
    addBullets();
    addAsteroid();
    addFlair();
    addUFO();
    move();
    fill(255);
    textAlign(LEFT, CENTER);
    textSize(25);
    text("Lives: " + myShip.lives, 0, 10);
    textAlign(LEFT);
    text("Score: " + score, 0, 50);
  } else if (mode == LOSE) {
    background(120, 0, 0);
    Button die = new Button(width/2, height/2 - 200, 0, 0, 0, 0, 255, "YOU DIED", 70, 0);
    die.show();
    if (score>highScore) {
      Button high = new Button(width/2, height/2, 0, 0, 0, 0, 255, "NEW HIGHSCORE: " + score, 70, 0);
      high.show();
    } else {
      Button high = new Button(width/2, height/2, 0, 0, 0, 0, 255, "CURRENT SCORE: " + score, 70, 0);
      high.show();
    }
    Button retry = new Button(width/2, height/2+200, 300, 100, 0, 7, 255, "RETRY", 70, 0);
    retry.show();

    if (retry.mouseClick()) {
      mouse = false;
      highScore = Math.max(highScore, score);
      mode = START;
    }
  } else if (mode== PAUSE) {
    background(30);
    myShip.show();
    for (GameObject i : objects) {
      i.show();
    }
    Button paused = new Button(width/2, height/2, 420, 150, 0, 4, 255, "PAUSED", 100, 0);
    paused.show();
    if (paused.mouseClick() || squiggle) {
      squiggle = false;
      mode = GAME;
    }
  }
}
