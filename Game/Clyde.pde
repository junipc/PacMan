public class Clyde extends Ghost{
  
  
  Clyde(color c, int x, int y, float s){
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
      pDist = dist(bx,by,p.bx,p.by);
      if(pDist < 6)
        turn = closestTurn(turns, 1, 23);
      else
        turn = closestTurn(turns, p.bx, p.by);
    }
    move(b,turn[2],turn[3]);
  }
  
}