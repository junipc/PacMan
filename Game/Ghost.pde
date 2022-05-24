public abstract class Ghost{
  color c;
  int x;
  int y;
  Ghost(color c_, int x_, int y_){
    c = c_;
    x = x_;
    y = y_;
  }
  abstract void move();
  void display(){
    fill(c);
    arc(x,y,30,30,PI,2*PI);
    rect(x-15,y,30,12);
    triangle(x-15,y+12,x-10,y+12,x-15,y+18);
    triangle(x-10,y+12,x,y+12,x-5,y+18);
    triangle(x,y+12,x+10,y+12,x+5,y+18);
    triangle(x+15,y+12,x+10,y+12,x+15,y+18);
  }
}
