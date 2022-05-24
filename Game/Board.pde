public class Board{
  int[][] map;
  int score = 0; //do i need to make static or
  
  public Board(int mode){
    map = new int[27][27];
    int[][] helperFourth = new int[][]{// 0 pellet; 1 wall; 2 place w/ no pellet;
    {1,1,1,1,1,1,1,1,1,1,1,1,1}, //this will be one fourth of the board to
    {1,0,0,0,0,0,0,0,0,0,0,0,0}, //copy by symmetry w/ for loops
    {1,0,1,1,1,0,0,1,1,1,1,0,0}, // then the center col/row will be added if odd row/c
    {1,0,1,1,1,0,0,1,1,1,1,0,0},
    {1,0,0,0,0,0,0,0,0,0,0,0,0},
    {1,0,1,1,1,0,1,0,1,1,1,1,1},
    {1,0,0,0,0,0,1,0,0,0,0,0,1},
    {1,1,1,1,1,0,1,1,1,1,1,2,2},
    {2,2,2,2,1,0,1,1,2,2,2,2,2},
    {2,2,2,2,1,0,1,1,2,2,1,1,1}, //cage starts with the ending 1,1,1 for the ghosts
    {1,1,1,1,1,0,1,1,2,2,1,2,2}}; //cage here w/ 1,2,2; row below this will be goin off the screen time
    if (mode == 0){//classic
      for (int i = 14; i < 27; i++){
      //only neeed to make 1/4 of map and can copy it 4 times; fix indices
      }
    }
    if (mode == 1){//survival rng
    
    }
  }
  
  public void preset(){ //very similar to this:SQUARESIZE = height/ROWS;//side length
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
