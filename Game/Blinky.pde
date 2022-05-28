public class Blinky extends Ghost{
  color c;
  float x;
  float y;
  float dx = 1;
  float dy = 0;
  float speed = 40/9; //40 must be divisible by it (just change the second number)
  int bx;
  int by;
  int counter = 1;
  
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
    int[][] movesToPacMan = new int[23][27];
    for (int i = 0; i < 23; i++){
      for (int j = 0; j < 27; j++){
        movesToPacMan[i][j] = 110105; //filler
        if (test.map[i][j] == 1){
          movesToPacMan[i][j] = -110105; //some irrelevant path move #
        }
      }
    }
    for (int i = 0; i < 23; i++){
      for (int j = 0; j < 27; j++){
        if (test.map[i][j] != 1){
          //basically not border or tree
          if (test.map[i+1][j] != 1){
            movesToPacMan[i+1][j] = counter;
            counter++;
            //recursive call
          }
          if (test.map[i-1][j] != 1){
            movesToPacMan[i-1][j] = counter;
            counter++;
            //recursive call
          }
          if (test.map[i][j+1] != 1){
            movesToPacMan[i][j+1] = counter;
            counter++;
            //recursive call
          }
          if (test.map[i][j-1] != 1){
             movesToPacMan[i][j-1] = counter;
            counter++;
            //recursive call
          }
          //updatedNum[i][j] = newWays;
          counter = 1; //?
        }
        else{
          counter = 1;
          //and reset path numbers?  or not necessary bcs we stop when we hit pacman, then move in direction of path#-1 each time
          //ex if 20 moves to pac man, we move to square w 19 moves to pac man as that must be optimized
        }
      }
    }
    //breadth first search probably best option
    //might be better to round floats of ghost and pacman location to int so that R,C
    //search is easier <3

   // x = (x + dx + width) % width;
    //y = (y + dy + height) % height;
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
