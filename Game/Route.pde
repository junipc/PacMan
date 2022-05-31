public class Route{
  ArrayList<Integer>dirs = new ArrayList();
  int[]coords = new int[2];
  
  Route(ArrayList<Integer>d, int[]c){
    dirs = d;
    coords = c;
  }
  Route(ArrayList<Integer>d, int cx, int cy){
    dirs = d;
    coords = new int[]{cx,cy};
  }
}
