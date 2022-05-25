public class PacMan{
  color c;
  int x;
  int y;
  
  PacMan(color c_, int x_, int y_){
    c = c_;
    x = x_;
    y = y_;
  }
  
  void display(){
    noStroke();
    fill(c);
    arc(x,y,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
  }
}
