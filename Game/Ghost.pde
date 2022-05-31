public abstract class Ghost{
  color c;
  float x;
  float y;
  float dx = 1;
  float dy = 0;
  float speed; //starts same speed as pacman, gets faster than him (dspeed/dlevel_ghosts > dspeed/dlevel_pac)?
  int bx;
  int by;
  boolean atCenter = true;
  Ghost(color c_, int x_, int y_, float s){
    c = c_;
    x = x_;
    y = y_;
    bx = (int)(x/40);
    by = (int)(y/40);
    speed = s;
  }
  abstract void move(float x_, float y_);
  void display(){
    noStroke();
    fill(c);
    arc(x,y,30,30,PI,2*PI,OPEN);
    rect(x-15,y,30,12);
    line(x-15,y,x-15,y+12);
    line(x+15,y,x+15,y+12);
    triangle(x-15,y+12,x-10,y+12,x-15,y+18);
    triangle(x-10,y+12,x,y+12,x-5,y+18);
    triangle(x,y+12,x+10,y+12,x+5,y+18);
    triangle(x+15,y+12,x+10,y+12,x+15,y+18);
  }
}
