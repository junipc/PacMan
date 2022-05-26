public class PacMan{
  color c;
  int x;
  int y;
  int dx = 1;
  int dy = 0;
  
  PacMan(color c_, int x_, int y_){
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
  
  void setDir(int x, int y){
    dx = x;
    dy = y;
  }
  void move(int x_, int y_){
    setDir(x_,y_);
    x += dx;
    y += dy; 
  }
  void move(){
    if(keyIn.isPressed(Keyboard.K_RT)){
      for(int i = 0; i < 40; i++)
      move(1,0);
    }
    if(keyIn.isPressed(Keyboard.K_LT))
    for(int i = 0; i < 40; i++)
    move(-1,0);
    if(keyIn.isPressed(Keyboard.K_UP))
    for(int i = 0; i < 40; i++)
    move(0,-1);
    if(keyIn.isPressed(Keyboard.K_DN))
    for(int i = 0; i < 40; i++)
    move(0,1);
  }
}
