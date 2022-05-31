import java.util.*;
public class Blinky extends Ghost{
  int counter = 1;
  int[][] currentOptimalPlay = new int[23][27];
  ArrayDeque<Route>frontier;
  int[][] tempMap;
  
  void setDir(float x, float y){
    dx = x;
    dy = y;
  }
  void move(){
    x = (x + dx + width) % width;
    y = (y + dy + height) % height;
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
  
  boolean done(PacMan p){
    ArrayDeque<Route>tempQ = frontier.clone();
    int qSize = tempQ.size();
    for(int i = 0; i < qSize; i++){
       Route r = tempQ.remove();
       if(r.coords[0] == p.bx && r.coords[1] == p.by)
       return true;
    }
    return false;
  }
  void tick(){
    int qSize = frontier.size();
    for(int i = 0; i < qSize; i++){
      Route r = frontier.remove();
      int cx = r.coords[0];
      int cy = r.coords[1];
      updateSide(cx,cy-1,0,r);
      updateSide(cx+1,cy,1,r);
      updateSide(cx,cy+1,2,r);
      updateSide(cx-1,cy,3,r);
      tempMap[cy][cx] = 1;
    }
  }
  void updateSide(int cx, int cy, int dir, Route r){
    if(cy < tempMap.length && cy >= 0 && cx < tempMap[0].length && cx >= 0 && tempMap[cy][cx] == 0){
      tempMap[cy][cx] = 1;
      ArrayList<Integer>nDirs = new ArrayList();
      for(int i = 0 ; i < r.dirs.size(); i++){
        nDirs.add(r.dirs.get(i));
      }
      nDirs.add(dir);
      Route nr = new Route(nDirs,cx,cy);
      frontier.add(nr);
    }
  }
  int step(PacMan p){
    while(!(done(p))){
      tick();
    }
    int qSize = frontier.size();
    for(int i = 0; i < qSize; i++){
       Route r = frontier.remove();
       if(r.coords[0] == p.bx && r.coords[1] == p.by)
       return r.dirs.get(0);
    }
    return 0;
  }
  void newStep(int[][]map){
    tempMap = new int[map.length][map[0].length];
    for(int i = 0; i < map.length; i++){
      for(int j = 0; j < map[0].length; j++){
        if(map[i][j] == 1)
        tempMap[i][j] = 1;
        else
        tempMap[i][j] = 0;
      }
    }
    frontier = new ArrayDeque();
  }
  
  void move(int dir){
    if(atCenter){
      if(dir == 0){
        setDir(0,speed*-1);
        move();
        atCenter = false;
      }else if(dir == 1){
        setDir(speed,0);
        move();
        atCenter = false;
      }else if(dir == 2){
        setDir(0,speed);
        move();
        atCenter = false;
      }else if(dir == 3){
        setDir(speed*-1,0);
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
