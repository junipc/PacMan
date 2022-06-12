import java.util.*;
public class Board{
  int[][] map;
  //int score = 0; //do i need to make static or
  
  public Board(int mode){
    map = new int[23][27];
    int[][]classicBoard = new int[][]{// 0 pellet; 1 wall; 2 place w/ no pellet; 3 powerpellet; 4 cage exit (cool display later); 5 cherry
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,3,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,3,1},
      {1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,0,1},
      {1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,1},
      {1,1,1,1,1,0,1,1,1,1,1,1,2,1,2,1,1,1,1,1,1,0,1,1,1,1,1},
      {1,1,1,1,1,0,1,1,1,2,2,2,2,2,2,2,2,2,1,1,1,0,1,1,1,1,1},
      {1,1,1,1,1,0,1,1,1,2,1,1,1,1,1,1,1,2,1,1,1,0,1,1,1,1,1},
      {2,2,2,2,2,0,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,0,2,2,2,2,2},
      {1,1,1,1,1,0,1,1,1,2,1,1,1,1,1,1,1,2,1,1,1,0,1,1,1,1,1},
      {1,1,1,1,1,0,1,1,1,2,2,2,2,2,2,2,2,2,1,1,1,0,1,1,1,1,1},
      {1,1,1,1,1,0,1,1,1,2,1,1,1,1,1,1,1,2,1,1,1,0,1,1,1,1,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1},
      {1,3,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,3,1},
      {1,1,1,0,1,0,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,0,1,0,1,1,1},
      {1,0,0,0,0,0,1,1,0,0,0,0,1,1,1,0,0,0,0,1,1,0,0,0,0,0,1},
      {1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1},
      {1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
    };
    /*int[][] helperFourth = new int[][]{// 0 pellet; 1 wall; 2 place w/ no pellet; 3 powerpellet; 4 cage exit (cool display later)
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
    */
    if (mode == 0){//classic
      map = classicBoard;
      /*for (int i = 0; i < 12; i++){
        for (int j = 0; j < 14; j++){
          map[i][j] = helperFourth[i][j];//only neeed to make 1/4 of map and can copy it 4 times; fix indices
          map[i][26-j] = helperFourth[i][j];
          map[22-i][j] = helperFourth[i][j];
          map[22-i][26-j] = helperFourth[i][j];
        }
      }
      map[2][1] = 3;
      map[2][25] = 3;
      */
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
      int rand1R = (int)(Math.random()*19)+2;
      int rand2R = (int)(Math.random()*19)+2;
      int rand3R = (int)(Math.random()*19)+2;
      int rand4R = (int)(Math.random()*19)+2;
      int rand1C = (int)(Math.random()*23)+2;
      int rand2C = (int)(Math.random()*23)+2;
      int rand3C = (int)(Math.random()*23)+2;
      int rand4C = (int)(Math.random()*23)+2;
      int rand5C = (int)(Math.random()*23)+2;
      map[rand1R][rand1C] = 1;
      map[rand1R][rand2C] = 1;
      map[rand1R][rand3C] = 1;
      map[rand1R][rand4C] = 1;
      map[rand1R][rand5C] = 1;
      map[rand2R][rand1C] = 1;
      map[rand2R][rand2C] = 1;
      map[rand2R][rand3C] = 1;
      map[rand2R][rand4C] = 1;
      map[rand2R][rand5C] = 1;
      map[rand3R][rand1C] = 1;
      map[rand3R][rand2C] = 1;
      map[rand3R][rand3C] = 1;
      map[rand3R][rand4C] = 1;
      map[rand3R][rand5C] = 1;
      map[rand4R][rand1C] = 1;
      map[rand4R][rand2C] = 1;
      map[rand4R][rand3C] = 1;
      map[rand4R][rand4C] = 1;
      map[rand4R][rand5C] = 1;
      currentExpanding.addLast(new int[]{rand1R, rand1C});
      currentExpanding.addLast(new int[]{rand1R, rand2C});
      currentExpanding.addLast(new int[]{rand1R, rand3C});
      currentExpanding.addLast(new int[]{rand1R, rand4C});
      currentExpanding.addLast(new int[]{rand1R, rand5C});
      currentExpanding.addLast(new int[]{rand2R, rand1C});
      currentExpanding.addLast(new int[]{rand2R, rand2C});
      currentExpanding.addLast(new int[]{rand2R, rand3C});
      currentExpanding.addLast(new int[]{rand2R, rand4C});
      currentExpanding.addLast(new int[]{rand2R, rand5C});
      currentExpanding.addLast(new int[]{rand3R, rand1C});
      currentExpanding.addLast(new int[]{rand3R, rand2C});
      currentExpanding.addLast(new int[]{rand3R, rand3C});
      currentExpanding.addLast(new int[]{rand3R, rand4C});
      currentExpanding.addLast(new int[]{rand3R, rand5C});
      currentExpanding.addLast(new int[]{rand4R, rand1C});
      currentExpanding.addLast(new int[]{rand4R, rand2C});
      currentExpanding.addLast(new int[]{rand4R, rand3C});
      currentExpanding.addLast(new int[]{rand4R, rand4C});
      currentExpanding.addLast(new int[]{rand4R, rand5C});

      //map[(int)(Math.random()*19)+2][(int)(Math.random()*23)+2] = 1;
      
      //map[11][13] = 1; //we can add/remove/change centers of 'islands' if wanted 
      //map[6][7] = 1;
      //map[6][19] = 1;
      //map[16][19] = 1;
      //map[16][7] = 1;
      //map[11][7] = 1;
      //map[11][19] = 1;
      //map[6][13] = 1;
      //map[16][13] = 1;
      
      //map[11][23] = 1; //we can add/remove/change centers of 'islands' if wanted 
      //map[6][23] = 1;
      //map[16][23] = 1;
      //map[6][3] = 1;
      //map[16][3] = 1;
      //map[11][3] = 1;
      
      //currentExpanding.addLast(new int[]{11, 13});//we can add/remove/change centers of 'islands' if wanted 
      //currentExpanding.addLast(new int[]{6, 7});
      //currentExpanding.addLast(new int[]{6, 19});
      //currentExpanding.addLast(new int[]{16, 19});
      //currentExpanding.addLast(new int[]{16, 7});
      //currentExpanding.addLast(new int[]{11, 7});
      //currentExpanding.addLast(new int[]{11, 19});
      //currentExpanding.addLast(new int[]{6, 13});
      //currentExpanding.addLast(new int[]{16, 13});
      
      //currentExpanding.addLast(new int[]{11, 23});
      //currentExpanding.addLast(new int[]{6, 23});
      //currentExpanding.addLast(new int[]{16, 23});
      //currentExpanding.addLast(new int[]{6, 3});
      //currentExpanding.addLast(new int[]{16, 3});
      //currentExpanding.addLast(new int[]{11, 3});
      
      while (currentExpanding.size() > 0){
        int[] currentXY = currentExpanding.getFirst();

        //shldnt ever go out bcs boundary is walls so shld never get within 2 of walls
        //2 above so no paths blocked; 1 above shldnt be bad bcs arraydeq only has edge ones
        if (map[currentXY[0]][currentXY[1]+2] != 1 && map[currentXY[0]+1][currentXY[1]+2] != 1 && map[currentXY[0]-1][currentXY[1]+2] != 1){
          if (Math.random() >.4){
            map[currentXY[0]][currentXY[1]+1] = 1;
            currentExpanding.addLast(new int[]{currentXY[0], currentXY[1]+1});
          }
        } 
        if (map[currentXY[0]+2][currentXY[1]] != 1 && map[currentXY[0]+2][currentXY[1]+1] != 1 && map[currentXY[0]+2][currentXY[1]-1] != 1){
          if (Math.random() >.4){ 
            map[currentXY[0]+1][currentXY[1]] = 1;
            currentExpanding.addLast(new int[]{currentXY[0]+1, currentXY[1]});
          }
        } 
        if (map[currentXY[0]][currentXY[1]-2] != 1 && map[currentXY[0]+1][currentXY[1]-2] != 1 && map[currentXY[0]-1][currentXY[1]-2] != 1){
          if (Math.random() >.4){
            map[currentXY[0]][currentXY[1]-1] = 1;
            currentExpanding.addLast(new int[]{currentXY[0], currentXY[1]-1});
          }
        } 
        if (map[currentXY[0]-2][currentXY[1]] != 1 && map[currentXY[0]-2][currentXY[1]+1] != 1 && map[currentXY[0]-2][currentXY[1]-1] != 1){
          if (Math.random() >.4){
            map[currentXY[0]-1][currentXY[1]] = 1;
            currentExpanding.addLast(new int[]{currentXY[0]-1, currentXY[1]});
          }     
        } 
        //if (Math.random() > .8){
        //  currentExpanding.addLast(currentExpanding.getFirst());
        //}
        currentExpanding.removeFirst();
      }
      for (int i = 2; i < 21;i++){
        for (int j = 2; j < 25; j++){
          if (map[i][j] == 2 && map[i][j+1] == 2 && map[i+1][j] == 2 && map[i+1][j+1] == 2){
            map[i][j] = 1;
            
          }
        }
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
          if (map[i][j] == 0 || map[i][j] == 2 || map[i][j] == 3 || map[i][j] == 4 || map[i][j] == 5){
            noStroke();
            fill(0,0,0);
            square(j*sideLength, i*sideLength, sideLength);
            float xPos = j*sideLength + sideLength/2.0;
            float yPos = i*sideLength + sideLength/2.0;
            if (map[i][j] == 0){ //pellet display
              fill(249,216,203);
              square(xPos - 4, yPos - 4, 8);
            }
            if (map[i][j] == 3){ //pellet display
              fill(255,255,0);
              circle(xPos, yPos, 25);
            }
            if (map[i][j] == 5){
              fill(254,0,0);
              stroke(180,0,0);
              circle(xPos - 10, yPos + 6, 15);
              circle(xPos + 3, yPos + 10, 15);
              stroke(221,151,81);
              line(xPos + 6, yPos - 10, xPos - 10, yPos + 2);
              line(xPos + 6, yPos - 10, xPos + 3, yPos + 6);
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
