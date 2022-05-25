import java.util.*;
public class Board{
  int[][] map;
  int score = 0; //do i need to make static or
  
  public Board(int mode){
    map = new int[23][27];
    int[][] helperFourth = new int[][]{// 0 pellet; 1 wall; 2 place w/ no pellet;
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1}, //this will be one fourth of the board to
    {1,0,0,0,0,0,0,0,0,0,0,0,0,1}, //copy by symmetry w/ for loops
    {1,0,1,1,1,0,0,1,1,1,1,0,0,1}, // then the center col/row will be added if odd row/c
    {1,0,1,1,1,0,0,1,1,1,1,0,0,1}, // bot row and right most col will be repeated 
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {1,0,1,1,1,0,1,0,1,1,1,1,1,1},
    {1,0,0,0,0,0,1,0,0,0,0,0,1,1},
    {1,1,1,1,1,0,1,1,1,1,1,2,2,1},
    {2,2,2,2,1,0,1,1,2,2,2,2,2,2},
    {2,2,2,2,1,0,1,1,2,2,1,1,1,1}, //cage starts with the ending 1,1,1 for the ghosts
    {1,1,1,1,1,0,1,1,2,2,1,2,2,2}, //cage here w/ 1,2,2; row below this will be goin off the screen time
    {2,2,2,2,2,0,2,2,2,2,1,2,2,2} // tp/going off board on this row
    };
    if (mode == 0){//classic
      for (int i = 0; i < 12; i++){
        for (int j = 0; j < 14; j++){
          map[i][j] = helperFourth[i][j];//only neeed to make 1/4 of map and can copy it 4 times; fix indices
          map[i][26-j] = helperFourth[i][j];
          map[22-i][j] = helperFourth[i][j];
          map[22-i][26-j] = helperFourth[i][j];
        }
      }
    }
    if (mode == 1){//survival rng
    
    }
  }
  
  public String getMapString(){
    return Arrays.deepToString(map); 
  }
  
  public void display(){
    int sideLength = height/23; //shld be 40
    for (int i = 0; i < 23; i++){
      for (int j = 0; j < 27; j++){
        if (map[i][j] == 0 || map[i][j] == 2){
          fill(0,0,0);
          square(j*sideLength, i*sideLength, sideLength);
          if (map[i][j] == 0){ //pellet display
            fill(255,255,0);
            circle(j*sideLength + sideLength/2.0, i*sideLength+ sideLength/2.0, 10);
          }
        }
        else if (map[i][j] == 1){
          fill(33, 33, 222);
          square(j*sideLength, i*sideLength, sideLength);
        }
      }
    }
  }
  
  public void preset(){
    
    
    //very similar to this:SQUARESIZE = height/ROWS;//side length
  //void stringToSquares(String[]lines) {
  //  for (int i = 0; i < lines.length; i++){
  //    for (int j = 0; j < (lines[i]).length(); j++){
  //      if ((lines[i]).charAt(j) == ' '){
  //        fill(255);
  //        square(j*SQUARESIZE,i*SQUARESIZE,SQUARESIZE);
  //      }
  //      if ((lines[i]).charAt(j) == '@'){
  //        fill(0,255,0);
  //        square(j*SQUARESIZE,i*SQUARESIZE,SQUARESIZE);
  //      }
  //      if ((lines[i]).charAt(j) == 'w'){
  //        fill(255,0,0);
  //        square(j*SQUARESIZE,i*SQUARESIZE,SQUARESIZE);
  //      }
  //      if ((lines[i]).charAt(j) == '.'){
  //        fill(175);
  //        square(j*SQUARESIZE,i*SQUARESIZE,SQUARESIZE);
  //      }
  //    }
  //  }
  }
}
