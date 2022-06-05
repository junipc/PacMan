public class Blinky extends Ghost{
  
  
  Blinky(color c, int x, int y, float s){
    super(c,x,y,s);
  }
  
  void move(PacMan p, Board b){
    ArrayList<int[]>turns = countTurns(b);
    int[]turn = closestTurn(turns, p.bx, p.by);
  }
  
}
