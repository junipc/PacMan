import java.util.*;
public class Blinky extends Ghost{
  int counter = 1;
  int[][] currentOptimalPlay = new int[23][27];
  ArrayDeque<int[]>frontier;
  int ticks;
  int[][] tempMap;
  
  void setDir(float x, float y){
    dx = x;
    dy = y;
  }
  int[][] moveHelper(int endX, int endY, int startX, int startY, int[][]movesToPacMan){
   int j = startX;
   int i = startY;
    if (test.map[i][j] != 1 && !(i == endY && j == endX) && movesToPacMan[i][j] == 110105){
      //basically not wall or alr travelled to (110105 appears in regular move(x_,y_))
      if (test.map[i+1][j] != 1){
        movesToPacMan[i+1][j] = counter;
        counter++;
        moveHelper(endX, endY, startX, startY+1, movesToPacMan);
      }
      if (test.map[i-1][j] != 1){
        movesToPacMan[i-1][j] = counter;
        counter++;
        moveHelper(endX, endY, startX, startY-1, movesToPacMan);
      }
      if (test.map[i][j+1] != 1){
        movesToPacMan[i][j+1] = counter;
        counter++;
        moveHelper(endX, endY, startX+1, startY, movesToPacMan);
      }
      if (test.map[i][j-1] != 1){
         movesToPacMan[i][j-1] = counter;
        counter++;
        moveHelper(endX, endY, startX-1, startY, movesToPacMan);
      }
      //updatedNum[i][j] = newWays;
      counter = 1; //?
    }
    else if (i == endY && j == endX){
    }
    else{
      counter = 1;
      //and reset path numbers?  or not necessary bcs we stop when we hit pacman, then move in direction of path#-1 each time
      //ex if 20 moves to pac man, we move to square w 19 moves to pac man as that must be optimized
    } 
    return movesToPacMan;
  }
  void move(float x_, float y_){ //update for blinky maze optimization
    setDir(x_,y_);
    int endX = Math.round(p.x/27);
    int endY = Math.round(p.y/23);
    int startX = Math.round(x/27);
    int startY = Math.round(y/23);
    //int[] dx = {0,0,1,-1}; //r,l,d,u
    //int[] dy = {1,-1,0,0};//r,l,d,u
    int[][] movesToPacMan = new int[23][27];
    currentOptimalPlay = moveHelper(endX, endY, startX, startY, movesToPacMan);
    //breadth first search probably best option
    //might be better to round floats of ghost and pacman location to int so that R,C
    //search is easier <3

   
  }
  
  void optimalMove(float x_, float y_){
  move( x_, y_);
  if (currentOptimalPlay[Math.round(p.y/23)][Math.round(p.x/27)] == 1 + currentOptimalPlay[Math.round(p.y/23)-1][Math.round(p.x/27)]){
  //set the next move to U
  }
  else if (currentOptimalPlay[Math.round(p.y/23)][Math.round(p.x/27)] == 1 + currentOptimalPlay[Math.round(p.y/23)+1][Math.round(p.x/27)]){
  //set the next move to D
  }
  else if (currentOptimalPlay[Math.round(p.y/23)][Math.round(p.x/27)] == 1 + currentOptimalPlay[Math.round(p.y/23)][Math.round(p.x/27)-1]){
  //set the next move to L
  }
  else{
  //set the next move to R
  }
   x = (x + dx + width) % width;
   y = (y + dy + height) % height;
  }
  
  Blinky(color c, int x, int y){
    super(c,x,y);
  }
  
  boolean done(){
    ArrayDeque<int[]>tempQ = frontier.clone();
    for(int i = 0; i < tempQ.size(); i++){
       
    }
  }
  
  void move(Board b){
    if(x % 40 > 19 && x % 40 < 21 && y % 40 > 19 && y % 40 < 21){
      if(keyIn.isPressed(Keyboard.K_RT) && canMove(b,1,0)){
        optimalMove(speed/9,0);
      }else if(keyIn.isPressed(Keyboard.K_LT) && canMove(b,-1,0)){
        optimalMove(speed/-9,0);
      }else if(keyIn.isPressed(Keyboard.K_UP) && canMove(b,0,-1)){
        optimalMove(0,speed/(-9));
      }else if(keyIn.isPressed(Keyboard.K_DN) && canMove(b,0,1)){
        optimalMove(0,speed/9);
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
