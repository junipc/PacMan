public class PacMan{
  color c;
  float x;
  float y;
  float dx = 1;
  float dy = 0;
  float speed; //any float <= 40.0, higher = choppier
  int bx;
  int by;
  boolean atCenter = true;
  boolean alive = true;
  boolean chomp = false;
  int deathTimer = -1;
  
  PacMan(color c_, int x_, int y_){ //x_ and y_ must be 40n+20
    c = c_;
    x = x_;
    y = y_;
    bx = (int)(x/40);
    by = (int)(y/40);
    speed = 1.05 * (level/5.0) + 2.15;
  }
  void die(){
    alive = false;
    deathTimer = 75;
  }
  void revive(){
    alive = true;
  }
  float waka(){
    return PI*sin(frameCount/3)/6;
  }
  void display(){
    noStroke();
    fill(c);
    if(alive){
      if(chomp){
        if(dx > 0)
          arc(x,y,33,33,QUARTER_PI+waka(), 2*PI-QUARTER_PI-waka());
        if(dy > 0)
          arc(x,y,33,33,QUARTER_PI+HALF_PI+waka(), 2*PI-QUARTER_PI+HALF_PI-waka());
        if(dx < 0)
          arc(x,y,33,33,QUARTER_PI+PI+waka(), 2*PI-QUARTER_PI+PI-waka());
        if(dy < 0)
          arc(x,y,33,33,QUARTER_PI+HALF_PI+PI+waka(), 2*PI-QUARTER_PI+HALF_PI+PI-waka());
      }else{
        if(dx > 0)
          arc(x,y,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
        if(dy > 0)
          arc(x,y,33,33,QUARTER_PI+HALF_PI, 2*PI-QUARTER_PI+HALF_PI);
        if(dx < 0)
          arc(x,y,33,33,QUARTER_PI+PI, 2*PI-QUARTER_PI+PI);
        if(dy < 0)
          arc(x,y,33,33,QUARTER_PI+HALF_PI+PI, 2*PI-QUARTER_PI+HALF_PI+PI);
      }
  }else{
      if(deathTimer > 60)
        arc(x,y,33,33,QUARTER_PI+HALF_PI+PI, 2*PI-QUARTER_PI+HALF_PI+PI);
      else if(deathTimer > 45)
        arc(x,y,33,33,0,PI);
      else if(deathTimer > 30)
        arc(x,y,33,33,QUARTER_PI,HALF_PI+QUARTER_PI);
      else if(deathTimer > 15)
        arc(x,y,33,33,HALF_PI-PI/8,HALF_PI+PI/8);
      if(deathTimer > 0)
        deathTimer --;
    }
  }
  
  void setDir(float x, float y){
    dx = x;
    dy = y;
  }
  void move(){
    x = (x + dx + width) % width;
    y = (y + dy + height) % height;
  }
  void move(Board b){
    if(alive){
      if(atCenter){
        eat(b);
        if(keyIn.isPressed(Keyboard.K_RT) && canMove(b,1,0)){
          setDir(speed,0);
          move();
          atCenter = false;
          chomp = true;
        }else if(keyIn.isPressed(Keyboard.K_LT) && canMove(b,-1,0)){
          setDir(speed*-1,0);
          move();
          atCenter = false;
          chomp = true;
        }else if(keyIn.isPressed(Keyboard.K_UP) && canMove(b,0,-1)){
          setDir(0,speed*-1);
          move();
          atCenter = false;
          chomp = true;
        }else if(keyIn.isPressed(Keyboard.K_DN) && canMove(b,0,1)){
          setDir(0,speed);
          move();
          atCenter = false;
          chomp = true;
        }
      }else{
        if(goesOver()){
          x = bx * 40 + 20;
          y = by * 40 + 20;
          atCenter = true;
          chomp = false;
        }else{
          move();
        }
      }
    }
  }
  boolean goesOver(){
    float nextX = x + dx;
    float nextY = y + dy;
    if(dx > 0)
      return nextX >= bx * 40 + 20;
    else if(dy > 0)
      return nextY >= by * 40 + 20;
    else if(dx < 0)
      return nextX <= bx * 40 + 20;
    else if(dy < 0)
      return nextY <= by * 40 + 20;
    else
      return false;
  }
  boolean canMove(Board b, int incX, int incY){
    int nextX = (bx + incX + b.map[0].length) % b.map[0].length;
    int nextY = (by + incY + b.map.length) % b.map.length;
    if(b.map[nextY][nextX] == 1 || b.map[nextY][nextX] == 4){
      return false;
    }else{
      bx = nextX;
      by = nextY;
      return true;
    }
  }
  void eat(Board b){
    if(b.map[by][bx] == 0){
      b.map[by][bx] = 2;
      totalScore += 10;
      startingPellets--;
    }
    if(b.map[by][bx] == 3){
       b.map[by][bx] = 2;
        totalScore += 50;
        fright = true;
        eatStreak = 0;
        if(level <= 1)
          frightTimer = 600;
        else if(level <= 4)
          frightTimer = 450;
        else if(level <= 7)
          frightTimer = 300;
        else
          frightTimer = 180;
    }
    if(b.map[by][bx] == 5){
      b.map[by][bx] = 2;
      int cherryPoints = 100 * level;
      totalScore += cherryPoints;
      eatenCherryTimer = 60;
    }
  }
}
