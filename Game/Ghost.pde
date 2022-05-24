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
    arc(x,y,20,20,PI,2*PI);
  }
}
