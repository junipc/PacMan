import java.util.*;
public class Board{
  int[][] map;
  //int score = 0; //do i need to make static or
  
  public Board(int mode){
    map = new int[23][27];
    int[][] helperFourth = new int[][]{// 0 pellet; 1 wall; 2 place w/ no pellet; 3 powerpellet; 4 cage exit (cool display later)
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
      map[2][1] = 3;
      map[2][25] = 3;
    }
    if (mode == 1){//survival rng
      ArrayDeque<int[]>currentExpanding = new ArrayDeque<int[]>();
      int[][] tempMap = new int[23][27];
      for (int i = 0; i < 23; i++){
        for (int j = 0; j < 27; j++){
           if (i == 0 || i == 22 || j == 0 || j == 26){
             tempMap[i][j] = 1;
             map[i][j] = 1; //wall/border
             //do rng; start off with 5 or n islands randomly, build off of them by being like 50% chance smth becomes a wall
             //if theres no wall in front of it or diagonally in front of it or smth; else, leave it as a path
             //create a copy of the og map to ensure all squares change (or keep) states at the same time per run
             //then run it like a lot then thats it
           }
           else{
             tempMap[i][j] = 2;
             map[i][j] = 2; //empty (at first)
           }
        }
      }
      map[11][13] = 1; //we can add/remove/change centers of 'islands' if wanted 
      map[6][7] = 1;
      map[6][19] = 1;
      map[16][19] = 1;
      map[16][7] = 1;
      map[11][7] = 1;
      map[11][19] = 1;
      map[6][13] = 1;
      map[16][13] = 1;
      currentExpanding.addLast(new int[]{11, 13});//we can add/remove/change centers of 'islands' if wanted 
      currentExpanding.addLast(new int[]{6, 7});
      currentExpanding.addLast(new int[]{6, 19});
      currentExpanding.addLast(new int[]{16, 19});
      currentExpanding.addLast(new int[]{16, 7});
      currentExpanding.addLast(new int[]{11, 7});
      currentExpanding.addLast(new int[]{11, 19});
      currentExpanding.addLast(new int[]{6, 13});
      currentExpanding.addLast(new int[]{16, 13});
      while (currentExpanding.size() > 0){
        int[] currentXY = currentExpanding.getFirst();
        //shldnt ever go out bcs boundary is walls so shld never get within 2 of walls
        //2 above so no paths blocked; 1 above shldnt be bad bcs arraydeq only has edge ones
        if (map[currentXY[0]][currentXY[1]+2] != 1 && map[currentXY[0]+1][currentXY[1]+2] != 1 && map[currentXY[0]-1][currentXY[1]+2] != 1){
          if (Math.random() >.3){
            map[currentXY[0]][currentXY[1]+1] = 1;
            currentExpanding.addLast(new int[]{currentXY[0], currentXY[1]+1});
          }
        } 
        if (map[currentXY[0]+2][currentXY[1]] != 1 && map[currentXY[0]+2][currentXY[1]+1] != 1 && map[currentXY[0]+2][currentXY[1]-1] != 1){
           if (Math.random() >.3){ 
            map[currentXY[0]+1][currentXY[1]] = 1;
            currentExpanding.addLast(new int[]{currentXY[0]+1, currentXY[1]});
           }
        } 
        if (map[currentXY[0]][currentXY[1]-2] != 1 && map[currentXY[0]+1][currentXY[1]-2] != 1 && map[currentXY[0]-1][currentXY[1]-2] != 1){
           if (Math.random() >.3){
            map[currentXY[0]][currentXY[1]-1] = 1;
            currentExpanding.addLast(new int[]{currentXY[0], currentXY[1]-1});
           }
        } 
        if (map[currentXY[0]-2][currentXY[1]] != 1 && map[currentXY[0]-2][currentXY[1]+1] != 1 && map[currentXY[0]-2][currentXY[1]-1] != 1){
           if (Math.random() >.3){
            map[currentXY[0]-1][currentXY[1]] = 1;
            currentExpanding.addLast(new int[]{currentXY[0]-1, currentXY[1]});
           }
        } 
        currentExpanding.removeFirst();
      }
    }
  }
  
  public String getMapString(){
    return Arrays.deepToString(map); 
  }
  
  public void display(){
    int mode = 0; //just for now; in future, will be a parameter
    if (mode == 0){
      int sideLength = height/23; //shld be 40
      for (int i = 0; i < 23; i++){
        for (int j = 0; j < 27; j++){
          if (map[i][j] == 0 || map[i][j] == 2 || map[i][j] == 3 || map[i][j] == 4){
            fill(0,0,0);
            square(j*sideLength, i*sideLength, sideLength);
            if (map[i][j] == 0){ //pellet display
              fill(249,216,203);
              square(j*sideLength + sideLength/2.0 - 4, i*sideLength+ sideLength/2.0 - 4, 8);
            }
            if (map[i][j] == 3){ //pellet display
              fill(255,255,0);
              circle(j*sideLength + sideLength/2.0, i*sideLength+ sideLength/2.0, 25);
            }
          }
          else if (map[i][j] == 1){
            fill(33, 33, 222);
            square(j*sideLength, i*sideLength, sideLength);
          }
        }
      }
    }
    if (mode == 1){}
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
