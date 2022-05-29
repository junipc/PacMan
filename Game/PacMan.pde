public class PacMan{
  color c;
  float x;
  float y;
  float dx = 1;
  float dy = 0;
  float speed = 36 ; //15,18,20,24,30,36,40,45,60,72
  int bx;
  int by;
  
  PacMan(color c_, int x_, int y_){ //x_ and y_ must be 40n+20
    c = c_;
    x = x_;
    y = y_;
    bx = (int)(x/40);
    by = (int)(y/40);
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
  void move(float x_, float y_){
    setDir(x_,y_);
    x = (x + dx + width) % width;
    y = (y + dy + height) % height;
  }
  void move(Board b){
    if(x % 40 > 19 && x % 40 < 21 && y % 40 > 19 && y % 40 < 21){
      if(keyIn.isPressed(Keyboard.K_RT) && canMove(b,1,0)){
        move(speed/9,0);
      }else if(keyIn.isPressed(Keyboard.K_LT) && canMove(b,-1,0)){
        move(speed/-9,0);
      }else if(keyIn.isPressed(Keyboard.K_UP) && canMove(b,0,-1)){
        move(0,speed/(-9));
      }else if(keyIn.isPressed(Keyboard.K_DN) && canMove(b,0,1)){
        move(0,speed/9);
      }
    }else{
      move(dx,dy);
    }
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
  int eat(Board b){
    if(b.map[by][bx] == 0){
      b.map[by][bx] = 2;
      return 50;
    }else{
      return 0;
  }
}
