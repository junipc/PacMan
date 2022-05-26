public class PacMan{
  color c;
  int x;
  int y;
  int dx;
  int dy;
  
  PacMan(color c_, int x_, int y_){
    c = c_;
    x = x_;
    y = y_;
  }
  
  void display(){
    noStroke();
    fill(c);
    if(dir == 0)
    arc(x,y,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
    if(dir == 1)
    arc(x,y,33,33,QUARTER_PI+HALF_PI, 2*PI-QUARTER_PI+HALF_PI);
    if(dir == 2)
    arc(x,y,33,33,QUARTER_PI+PI, 2*PI-QUARTER_PI+PI);
    if(dir == 3)
    arc(x,y,33,33,QUARTER_PI+HALF_PI+PI, 2*PI-QUARTER_PI+HALF_PI+PI);
  }
  
  void setDir(int x, int y){
    dx = x;
    dy = y;
  }
  void move(int d){
    setDir(d);
    x += 
  }
}
