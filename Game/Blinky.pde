public class Blinky extends Ghost{
  color c;
  float x;
  float y;
  float dx = 1;
  float dy = 0;
  float speed = 40/9; //40 must be divisible by it (just change the second number)
  int bx;
  int by;
  
  void setDir(float x, float y){
    dx = x;
    dy = y;
  }
  void move(float x_, float y_){ //update for blinky maze optimization
    setDir(x_,y_);
    float endX = p.x/27;
    float endY = p.y/23;
    float startX = x/27;
    float startY = y/23;
    int[][] maze = test.map;
    int[] dx = {0,0,1,-1}; //r,l,d,u
    int[] dy = {1,-1,0,0};//r,l,d,u
    //breadth first search probably best option
    //might be better to round floats of ghost and pacman location to int so that R,C
    //search is easier <3
    
    
    //
  //  private int solve(int row, int col){ //you can add more parameters since this is private
  //  //automatic animation! You are welcome.
  //  if (maze[row][col] == '#' || maze[row][col] == '@' || maze[row][col] == '.'){
  //    return -1;
  //  }
  //  else if (maze[row][col] == 'E'){
  //    return 0;
  //  }
  //  else{
  //    maze[row][col] = '@';
  //    if(animate){ // put in spots 1 and 2 yk (?)
  //      gotoTop();
  //      System.out.println(this);
  //      wait(50);
  //    }
  //    int North = solve(row - 1, col);
  //    if (North != -1){
  //      return North + 1;
  //    }
  //    int South = solve (row + 1, col);
  //    if (South != -1){
  //      return South + 1;
  //    }
  //    int East = solve (row, col + 1);
  //    if (East != -1){
  //      return East + 1;
  //    }
  //    int West = solve (row, col - 1);
  //    if (West != -1){
  //      return West + 1;
  //    }
  //    maze[row][col] = '.';
  //    if(animate){ // put in spots 1 and 2 yk (?)
  //      gotoTop();
  //      System.out.println(this);
  //      wait(50);
  //    }
  //    return -1;
  //  }
  //}
    x = (x + dx + width) % width;
    y = (y + dy + height) % height;
  }
  
  Blinky(color c, int x, int y){
    super(c,x,y);
    bx = (int)(x/40);
    by = (int)(y/40);
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
}
