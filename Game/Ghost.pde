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
  boolean canMove = true;
  Ghost(color c_, int x_, int y_, float s){
    c = c_;
    x = x_;
    y = y_;
    bx = (int)(x/40);
    by = (int)(y/40);
    speed = s;
  }
  
  abstract void move(PacMan p, Board b);
  
  void setDir(float x, float y){
    if(by == 11 && (bx <= 4 || bx >= 22)){
      x *= .5;
      y *= .5;
    }
    dx = x;
    dy = y;
  }
  void move(){
    x = (x + dx + width) % width;
    y = (y + dy + height) % height;
  }
  void move(Board b, int dir){ //0 up, 1 right, 2 down, 3 left
    if(canMove){
      if(atCenter){
        if(dir == 0){
          setDir(0,speed*-1);
          incB(b,0,-1);
          move();
          atCenter = false;
        }else if(dir == 1){
          setDir(speed,0);
          incB(b,1,0);
          move();
          atCenter = false;
        }else if(dir == 2){
          setDir(0,speed);
          incB(b,0,1);
          move();
          atCenter = false;
        }else if(dir == 3){
          setDir(speed*-1,0);
          incB(b,-1,0);
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
  }
  void incB(Board b, int incX, int incY){
    bx = (bx + incX + b.map[0].length) % b.map[0].length;
    by = (by + incY + b.map.length) % b.map.length;
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
  
  int countTurns(Board b){
    int turns = 0;
    int cx = (bx + 1 + b.map[0].length) % b.map[0].length;
    if(b.map[by][cx] != 1 || b.map[by][cx] != 4)
      turns ++;
    cx = (bx - 1 + b.map[0].length) % b.map[0].length;
    if(b.map[by][cx] != 1 || b.map[by][cx] != 4)
      turns ++;
    int cy = (by + 1 + b.map.length) % b.map.length;
    if(b.map[cy][bx] != 1 || b.map[cy][bx] != 4)
      turns ++;
    cy = (by - 1 + b.map.length) % b.map.length;
    if(b.map[cy][bx] != 1 || b.map[cy][bx] != 4)
      turns ++;
    return turns;
  }
  
  void kill(PacMan p){
    if(p.alive)
    p.die();
  }
  
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
