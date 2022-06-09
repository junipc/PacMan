public class Inky extends Ghost{
  
  
  Inky(color c, int x, int y, float s){ //IMPORTANT: Inky needs a Blinky on board to run
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
      if(scatter)
        turn = closestTurn(turns,25,23);
      else{
        int vx = 2*(p.bx - g1.bx);
        int vy = 2*(p.by - g1.by);
        turn = closestTurn(turns, g1.bx + vx, g1.by + vy);
      }
    }
    move(b,turn[2],turn[3]);
  }
  
  void goHome(){
    x = 580;
    y = 420;
    bx = 14;
    by = 10;
    atCenter = true;
  }
}
