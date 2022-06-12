import java.util.*;
public class Board{
  int[][] map;
  ArrayList<int[]> noPelletsForSurvival = new ArrayList<int[]>();
  int mode;
  
  public Board(int mode){
    map = new int[23][27];
    this.mode = mode;
    int[][]classicBoard = new int[][]{// 0 pellet; 1 wall; 2 place w/ no pellet; 3 powerpellet; 4 cage exit; 5 cherry
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,3,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,3,1},
      {1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
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
    if (mode == 0){//classic
      map = classicBoard;
    }
    if (mode == 1){
      ArrayDeque<int[]>currentExpanding = new ArrayDeque<int[]>();
      int[][] tempMap = new int[23][27];
      for (int i = 0; i < 23; i++){
        for (int j = 0; j < 27; j++){
           if (i == 0 || i == 22 || j == 0 || j == 26){
             tempMap[i][j] = 1;
             map[i][j] = 1; //wall
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
      int rand5R = (int)(Math.random()*19)+2;
      int rand6R = (int)(Math.random()*19)+2;
      int rand7R = (int)(Math.random()*19)+2;
      int rand8R = (int)(Math.random()*19)+2;
      int rand9R = (int)(Math.random()*19)+2;
      int rand10R = (int)(Math.random()*19)+2;
      int rand11R = (int)(Math.random()*19)+2;
      int rand12R = (int)(Math.random()*19)+2;
      int rand13R = (int)(Math.random()*19)+2;
      int rand14R = (int)(Math.random()*19)+2;
      int rand15R = (int)(Math.random()*19)+2;
      int rand16R = (int)(Math.random()*19)+2;
      
      int rand1C = (int)(Math.random()*23)+2;
      int rand2C = (int)(Math.random()*23)+2;
      int rand3C = (int)(Math.random()*23)+2;
      int rand4C = (int)(Math.random()*23)+2;
      int rand5C = (int)(Math.random()*23)+2;
      int rand6C = (int)(Math.random()*23)+2;
      int rand7C = (int)(Math.random()*23)+2;
      int rand8C = (int)(Math.random()*23)+2;
      int rand9C = (int)(Math.random()*23)+2;
      int rand10C = (int)(Math.random()*23)+2;
      int rand11C = (int)(Math.random()*23)+2;
      int rand12C = (int)(Math.random()*23)+2;
      int rand13C = (int)(Math.random()*23)+2;
      int rand14C = (int)(Math.random()*23)+2;
      int rand15C = (int)(Math.random()*23)+2;
      int rand16C = (int)(Math.random()*23)+2;
      
      
      map[rand1R][rand1C] = 1;
      map[rand2R][rand2C] = 1;
      map[rand3R][rand3C] = 1;
      map[rand4R][rand4C] = 1;
      map[rand5R][rand5C] = 1;
      map[rand6R][rand6C] = 1;
      map[rand7R][rand7C] = 1;
      map[rand8R][rand8C] = 1;
      map[rand9R][rand9C] = 1;
      map[rand10R][rand10C] = 1;
      map[rand11R][rand11C] = 1;
      map[rand12R][rand12C] = 1;
      map[rand13R][rand13C] = 1;
      map[rand14R][rand14C] = 1;
      map[rand15R][rand15C] = 1;
      map[rand16R][rand16C] = 1;


      currentExpanding.addLast(new int[]{rand1R, rand1C});
      currentExpanding.addLast(new int[]{rand2R, rand2C});
      currentExpanding.addLast(new int[]{rand3R, rand3C});
      currentExpanding.addLast(new int[]{rand4R, rand4C});
      currentExpanding.addLast(new int[]{rand5R, rand5C});
      currentExpanding.addLast(new int[]{rand6R, rand6C});
      currentExpanding.addLast(new int[]{rand7R, rand7C});
      currentExpanding.addLast(new int[]{rand8R, rand8C});
      currentExpanding.addLast(new int[]{rand9R, rand9C});
      currentExpanding.addLast(new int[]{rand10R, rand10C});
      currentExpanding.addLast(new int[]{rand11R, rand11C});
      currentExpanding.addLast(new int[]{rand12R, rand12C});
      currentExpanding.addLast(new int[]{rand13R, rand13C});
      currentExpanding.addLast(new int[]{rand14R, rand14C});
      currentExpanding.addLast(new int[]{rand15R, rand15C});
      currentExpanding.addLast(new int[]{rand16R, rand16C});


      while (currentExpanding.size() > 0){
        int[] currentXY = currentExpanding.getFirst();
        if (map[currentXY[0]][currentXY[1]+2] != 1 && map[currentXY[0]+1][currentXY[1]+2] != 1 && map[currentXY[0]-1][currentXY[1]+2] != 1){
            map[currentXY[0]][currentXY[1]+1] = 1;
            if (Math.random() > .02){ //this here j so that small chance of making a dead end, cause why not
              currentExpanding.addLast(new int[]{currentXY[0], currentXY[1]+1});
            }
        } 
        if (map[currentXY[0]+2][currentXY[1]] != 1 && map[currentXY[0]+2][currentXY[1]+1] != 1 && map[currentXY[0]+2][currentXY[1]-1] != 1){
            map[currentXY[0]+1][currentXY[1]] = 1;
            if (Math.random() > .02){
              currentExpanding.addLast(new int[]{currentXY[0]+1, currentXY[1]});
            }
        } 
        if (map[currentXY[0]][currentXY[1]-2] != 1 && map[currentXY[0]+1][currentXY[1]-2] != 1 && map[currentXY[0]-1][currentXY[1]-2] != 1){
            map[currentXY[0]][currentXY[1]-1] = 1;
            if (Math.random() > .02){  
              currentExpanding.addLast(new int[]{currentXY[0], currentXY[1]-1});
            }
        } 
        if (map[currentXY[0]-2][currentXY[1]] != 1 && map[currentXY[0]-2][currentXY[1]+1] != 1 && map[currentXY[0]-2][currentXY[1]-1] != 1){
            map[currentXY[0]-1][currentXY[1]] = 1;
            if (Math.random() > .02){  
              currentExpanding.addLast(new int[]{currentXY[0]-1, currentXY[1]});
            }
        } 
        currentExpanding.removeFirst();
      }
      noPelletsForSurvival.clear();
      for (int i = 1; i < 22; i++){
        for (int j = 1; j < 26; j++){
          if (map[i][j] == 2){
            noPelletsForSurvival.add(new int[]{i, j});
          }
        }
      }
    }
  }
  
  public String getMapString(){
    return Arrays.deepToString(map); 
  }
  
  public void display(){
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

}
