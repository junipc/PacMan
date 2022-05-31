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
  
  PacMan(color c_, int x_, int y_){ //x_ and y_ must be 40n+20
    c = c_;
    x = x_;
    y = y_;
    bx = (int)(x/40);
    by = (int)(y/40);
    speed = 1.05 * (level/2.0) + 2.15;
  }
  
  void display(){
    noStroke();
    fill(c);
    if(dx > 0)
    arc(x,y,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
    if(dy > 0)
    arc(x,y,33,33,QUARTER_PI+HALF_PI, 2*PI-QUARTER_PI+HALF_PI);
    if(dx < 0)
    arc(x,y,33,33,QUARTER_PI+PI, 2*PI-QUARTER_PI+PI);
    if(dy < 0)
    arc(x,y,33,33,QUARTER_PI+HALF_PI+PI, 2*PI-QUARTER_PI+HALF_PI+PI);
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
    if(atCenter){
      eat(b);
      if(keyIn.isPressed(Keyboard.K_RT) && canMove(b,1,0)){
        setDir(speed,0);
        move();
        atCenter = false;
      }else if(keyIn.isPressed(Keyboard.K_LT) && canMove(b,-1,0)){
        setDir(speed*-1,0);
        move();
        atCenter = false;
      }else if(keyIn.isPressed(Keyboard.K_UP) && canMove(b,0,-1)){
        setDir(0,speed*-1);
        move();
        atCenter = false;
      }else if(keyIn.isPressed(Keyboard.K_DN) && canMove(b,0,1)){
        setDir(0,speed);
        move();
        atCenter = false;
      }
    }else{
      if(goesOver()){
        x = bx * 40 + 20;
        y = by * 40 + 20;
        atCenter = true;
      }else{
        move();
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
    if(b.map[nextY][nextX] == 1){
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
      totalScore += 50;
      startingPellets--;
    }
    if(b.map[by][bx] == 3){
       b.map[by][bx] = 2;
        totalScore += 100;
    }
  }
}
