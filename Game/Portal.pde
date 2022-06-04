public class Portal{
  int[] p1 = new int[2];
  int[] p2 = new int[2];
  
  Portal(int r1, int c1, int r2, int c2){
    p1[0] = r1;
    p1[1] = c1;
    p2[0] = r2;
    p2[1] = c2;
  }
  
  void displayp1(){
    noStroke();
    fill(54, 17, 102);
    circle(40 * p1[1] + 20,40 * p1[0] + 20, 20);
    fill(87, 28, 163);
    circle(40 * p1[1] + 20,40 * p1[0] + 20, 15);
    fill(147, 66, 252);    
    circle(40 * p1[1] + 20,40 * p1[0] + 20, 10);    
  }
  
    void displayp2(){
    noStroke();
    fill(54, 17, 102);
    circle(40 * p2[1] + 20,40 * p2[0] + 20, 20);
    fill(87, 28, 163);
    circle(40 * p2[1] + 20,40 * p2[0] + 20, 15);
    fill(147, 66, 252);    
    circle(40 * p2[1] + 20,40 * p2[0] + 20, 10);    
  }


}
