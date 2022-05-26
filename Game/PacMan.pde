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
    x = abs((x + dx) % width);
    y = abs((y + dy) % height);
  }
  void move(){
    if(x % 40 == 20 && y % 40 == 20){
      if(keyIn.isPressed(Keyboard.K_RT)){
        move(speed,0);
      }else if(keyIn.isPressed(Keyboard.K_LT)){
        move(speed*-1,0);
      }else if(keyIn.isPressed(Keyboard.K_UP)){
        move(0,speed*-1);
      }else if(keyIn.isPressed(Keyboard.K_DN)){
        move(0,speed);
      }
    }else{
      move(dx,dy);
    }
  }
}
