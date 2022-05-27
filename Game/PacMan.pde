public class PacMan{
  color c;
  float x;
  float y;
  float dx = 1;
  float dy = 0;
  float speed = 40/9; //40 must be divisible by it (just change the second number)
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
    if(x % 40 == 20 && y % 40 == 20){
      if(keyIn.isPressed(Keyboard.K_RT) && canMove(b,1,0)){
        move(speed,0);
        //bx++;
      }else if(keyIn.isPressed(Keyboard.K_LT)){
        move(speed*-1,0);
        bx--;
      }else if(keyIn.isPressed(Keyboard.K_UP)){
        move(0,speed*-1);
        by--;
      }else if(keyIn.isPressed(Keyboard.K_DN)){
        move(0,speed);
        by++;
      }
    }else{
      move(dx,dy);
    }
  }
  boolean canMove(Board b, int incX, int incY){
    bx = (bx + incX + b.map[0].length) % b.map[0].length;
    by = (by + incY + b.map.length) % b.map.length;
    return true;
  }
}
