public abstract class Ghost{
  color c;
  float x;
  float y;
  float dx = 1;
  float dy = 0;
  float speed; //starts same speed as pacman, gets faster than him (dspeed/dlevel_ghosts > dspeed/dlevel_pac)?
  int bx;
  int by;
  boolean atCenter = true;
  Ghost(color c_, int x_, int y_, float s){
    c = c_;
    x = x_;
    y = y_;
    bx = (int)(x/40);
    by = (int)(y/40);
    speed = s;
  }
  
  abstract void move(PacMan p, Board b);
  abstract void goHome();
  
  void setDir(float x, float y){
    if(fright){
      x *= .63;
      y *= .63;
    }else if(by == 10 && (bx <= 4 || bx >= 22)){ //SHOULD NOT SLOW DOWN IN SURVIVAL!
      x *= .5;
      y *= .5;
    }
    dx = x;
    dy = y;
  }
  void move(){
    x = (x + dx + width) % width;
    y = (y + dy + height) % height;
  }

  void move(Board b, int incX, int incY){ //0 up, 1 right, 2 down, 3 left
    if(ghostsCanMove){
      if(atCenter){
        setDir(speed*incX, speed*incY);
        incB(b,incX,incY);
        move();
        atCenter = false;
      }else{
        if(goesOver()){
          x = bx * 40 + 20;
          y = by * 40 + 20;
          atCenter = true;
        }else{
          move();
        }
      }
    }
  }
  void move(Board b, int dir){ //0 up, 1 right, 2 down, 3 left
    if(ghostsCanMove){
      if(atCenter){
        if(dir == 0){
          setDir(0,speed*-1);
          incB(b,0,-1);
          move();
          atCenter = false;
        }else if(dir == 1){
          setDir(speed,0);
          incB(b,1,0);
          move();
          atCenter = false;
        }else if(dir == 2){
          setDir(0,speed);
          incB(b,0,1);
          move();
          atCenter = false;
        }else if(dir == 3){
          setDir(speed*-1,0);
          incB(b,-1,0);
          move();
          atCenter = false;
        }
      }else{
        if(goesOver()){
          x = bx * 40 + 20;
          y = by * 40 + 20;
          atCenter = true;
        }else{
          move();
        }
      }
    }
  }
  void incB(Board b, int incX, int incY){
    bx = (bx + incX + b.map[0].length) % b.map[0].length;
    by = (by + incY + b.map.length) % b.map.length;
  }
  
  boolean goesOver(){
    float nextX = x + dx;
    float nextY = y + dy;
    if(dx > 0)
      return nextX >= bx * 40 + 20;
    else if(dy > 0)
      return nextY >= by * 40 + 20;
    else if(dx < 0)
      return nextX <= bx * 40 + 20;
    else if(dy < 0)
      return nextY <= by * 40 + 20;
    else
      return false;
  }
  
  boolean inCage(){
    return bx >= 10 && bx <= 16 && by >= 9 && by <= 11;
  }
  ArrayList<int[]> countTurns(Board b){
    ArrayList<int[]>turns = new ArrayList();
    int dbx = 0;
    int dby = 0;
    if(dx > 0)
      dbx = 1;
    else if (dx < 0)
      dbx = -1;
    if(dy > 0)
      dby = 1;
    else if (dy < 0)
      dby = -1;
    int pbx = (bx - dbx + b.map[0].length) % b.map[0].length;
    int pby = (by - dby + b.map.length) % b.map.length;
    
    int cx = (bx + 1 + b.map[0].length) % b.map[0].length;
    if((b.map[by][cx] != 1) && pbx != cx && ((inCage() && ! fright) || b.map[by][cx] != 4))
      turns.add(new int[]{cx,by,1,0});
    cx = (bx - 1 + b.map[0].length) % b.map[0].length;
    if((b.map[by][cx] != 1) && pbx != cx && ((inCage() && ! fright) || b.map[by][cx] != 4))
      turns.add(new int[]{cx,by,-1,0});
    int cy = (by + 1 + b.map.length) % b.map.length;
    if((b.map[cy][bx] != 1) && pby != cy && ((inCage() && ! fright) || b.map[cy][bx] != 4))
      turns.add(new int[]{bx,cy,0,1});
    cy = (by - 1 + b.map.length) % b.map.length;
    if((b.map[cy][bx] != 1) && pby != cy && ((inCage() && ! fright) || b.map[cy][bx] != 4))
      turns.add(new int[]{bx,cy,0,-1});
    
    if(turns.size() == 0)
      turns.add(new int[]{pbx,pby,-1*dbx,-1*dby});
    return turns;
  }
  
  int[] closestTurn(ArrayList<int[]>turns, int cx, int cy){
    if(fright){
      int randNum = (int)(random(turns.size()));
      return turns.get(randNum);
    }else{
      int[]first = turns.get(0);
      float minDist = dist(first[0],first[1],cx,cy);
      int num = 0;
      for(int i = 1; i < turns.size(); i++){
        int[]testSq = turns.get(i);
        float testDist = dist(testSq[0],testSq[1],cx,cy);
        if(testDist < minDist){
          minDist = testDist;
          num = i;
        }
      }
      return turns.get(num);
    }
  }
  
  void kill(PacMan p){
    if(fright){
      goHome();
      int killPoints = 200;
      for(int i = 0; i < eatStreak; i++)
        killPoints *= 2;
      totalScore += killPoints;
      levelScore += killPoints;
      eatStreak++;
    }else if(p.alive){
      ghostsCanMove = false;
      p.die();
    }
  }
  
  void display(){
    noStroke();
    if(fright)
      if(frightTimer > 90 || frightTimer % 16 < 8)
        fill(0,0,248);
      else
        fill(255);
    else
      fill(c);
    arc(x,y,30,30,PI,2*PI,OPEN);
    rect(x-15,y,30,12);
    line(x-15,y,x-15,y+12);
    line(x+15,y,x+15,y+12);
    triangle(x-15,y+12,x-10,y+12,x-15,y+18);
    triangle(x-10,y+12,x,y+12,x-5,y+18);
    triangle(x,y+12,x+10,y+12,x+5,y+18);
    triangle(x+15,y+12,x+10,y+12,x+15,y+18);
    
    if(fright){
      if(frightTimer > 90 || frightTimer % 16 < 8){
        fill(255);
        stroke(255);
      }else{
        fill(248,0,0);
        stroke(248,0,0);
      }
      rect(x-6,y-3,3,3);
      rect(x+4,y-3,3,3);
      strokeWeight(2);
      line(x-12,y+9,x-8,y+7);
      line(x-8,y+7,x-4,y+9);
      line(x-4,y+9,x,y+7);
      line(x,y+7,x+4,y+9);
      line(x+4,y+9,x+8,y+7);
      line(x+8,y+7,x+12,y+9);
      //line(x+6,y+9,x+9,y+7);
      //line(x+9,y+7,x+12,y+9);
      strokeWeight(1);
      noStroke();
    }
    
    else{
      fill(255); //sclerae
      if(dx > 0){
        ellipse(x-4,y-2,10,13);
        ellipse(x+10,y-2,10,13);
      }
      if(dx < 0){
        ellipse(x-10,y-2,10,13);
        ellipse(x+4,y-2,10,13);
      }
      if(dy > 0){
        ellipse(x-7,y,10,13);
        ellipse(x+7,y,10,13);
      }
      if(dy < 0){
        ellipse(x-7,y-5,10,13);
        ellipse(x+7,y-5,10,13);
      }
      
      fill(0,0,248); //pupils
      if(dx > 0){
        rect(x-5,y-3,5,5);
        rect(x+9,y-3,5,5);
      }
      if(dx < 0){
        rect(x-14,y-3,5,5);
        rect(x,y-3,5,5);
      }
      if(dy > 0){
        rect(x-9,y+1,5,5);
        rect(x+5,y+1,5,5);
      }
      if(dy < 0){
        rect(x-9,y-11,5,5);
        rect(x+5,y-11,5,5);
      }
    }
  }
}
