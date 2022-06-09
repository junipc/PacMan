public class Portal{
  int[] p1 = new int[2];
  int[] p2 = new int[2];
  float p1x;
  float p1y;
  float p2x;
  float p2y;
  int[] sizes = new int[]{32,26,20};
  float animator = 1;
  float add = 1;
  boolean canUse = true;
  
  Portal(int r1, int c1, int r2, int c2){
    p1[0] = r1;
    p1[1] = c1;
    p2[0] = r2;
    p2[1] = c2;
    doIt = millis();
    p1x = 40 * p1[1] + 20;
    p1y = 40 * p1[0] + 20;
    p2x = 40 * p2[1] + 20;
    p2y = 40 * p2[0] + 20;
  }
  
  void displayp1(){
    if (canUse){
      if (doIt == 500){
      if (animator >= 4){
        add = -1;
      }
      if (animator <= -2){
        add = 1;
      }
      animator += 1 * add;
      doIt = millis();
      }
      noStroke();
      fill(54, 17, 102);
      circle(40 * p1[1] + 20,40 * p1[0] + 20, sizes[0] + animator);
      fill(87, 28, 163);
      circle(40 * p1[1] + 20,40 * p1[0] + 20, sizes[1] + animator);
      fill(147, 66, 252);    
      circle(40 * p1[1] + 20,40 * p1[0] + 20, sizes[2] + animator);    
    }
  }
  
    void displayp2(){
    if (canUse){
      if (doIt == 500){
      if (animator >= 4){
        add = -1;
      }
      if (animator <= -2){
        add = 1;
      }
      animator += 1 * add;
      doIt = millis(); //hmm doesnt work
    }
    noStroke();
    fill(54, 17, 102);
    circle(40 * p2[1] + 20,40 * p2[0] + 20, sizes[0] + animator);
    fill(87, 28, 163);
    circle(40 * p2[1] + 20,40 * p2[0] + 20, sizes[1] + animator);
    fill(147, 66, 252);    
    circle(40 * p2[1] + 20,40 * p2[0] + 20, sizes[2] + animator);    
    }
  }
  
  void teleport(){ //tps in survival mode have 1 time usage
    if (canUse && dist(p.x, p.y, p1x, p1y) < .1){
      p.x = p2x;
      p.y = p2y;
      p.bx = (int)(p.x/40);
      p.by = (int)(p.y/40);
      canUse = false;
    }
    else if (canUse && dist(p.x, p.y, p2x, p2y) < .1){
      p.x = p1x;
      p.y = p1y;
      p.bx = (int)(p.x/40);
      p.by = (int)(p.y/40);
      canUse = false;
      noStroke();
      fill(54, 17, 102);
      //circle(40 * p2[1] + 20,40 * p2[0] + 20, 32); //remove portal
      alreadyPortal = false;
    }
    //if canUse = false then it self destructs LOL
  }


}
