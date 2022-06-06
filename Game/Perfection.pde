import java.util.*;
public class Perfection extends Ghost{
  ArrayDeque<Route>frontier;
  int[][] tempMap;
  
  Perfection(color c, int x, int y, float s){
    super(c,x,y,s);
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
    if(cy < tempMap.length || cy >= 0 || cx < tempMap[0].length || cx >= 0){
      cx = (cx + tempMap[0].length) % tempMap[0].length;
      cy = (cy + tempMap.length) % tempMap.length;
    }
    if(tempMap[cy][cx] == 0){
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
  int step(PacMan p1){
    while(!(done(p1))){
      tick();
    }
    int qSize = frontier.size();
    for(int i = 0; i < qSize; i++){
       Route r = frontier.remove();
       if(r.coords[0] == p.bx && r.coords[1] == p.by){
         if(r.dirs.size()==0){
           kill(p1);
           return -1;
         }else{
           return r.dirs.get(0);
         }
       }
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
    start();
  }
  void start(){
    tempMap[by][bx] = 1;
    frontier.add(new Route(new ArrayList<Integer>(), bx, by));
  }
  
  void move(PacMan p, Board b){
    newStep(b.map);
    move(b, step(p));
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
