public class Pinky extends Ghost{
  
  
  Pinky(color c, int x, int y, float s){
    super(c,x,y,s);
  }
  
  void move(PacMan p, Board b){
    if(bx == p.bx && by == p.by)
      kill(p);
    ArrayList<int[]>turns = countTurns(b);
    int[]turn;
    if(inCage())
      turn = closestTurn(turns,13,9);
    else{
      int incX = 0;
      int incY = 0;
      if(p.dx > 0){
        incX = 3;
      }else if(p.dx < 0){
        incX = -3;
      }
      if(p.dy > 0){
        incY = 3;
      }else if(p.dy < 0){
        incY = -3;
      }
      turn = closestTurn(turns, p.bx + incX, p.by + incY);
    }
    move(b,turn[2],turn[3]);
  }
  
}
