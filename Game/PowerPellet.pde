public class PowerPellet extends Pellet{
  
  
  public void add(){
    for (int i = 0; i < 23; i++){ //test, smth seems to not work
      for (int j = 0; j < 27; j++){
        if (test.map[i][j] == 3){
          powerNotEaten.add(new PowerPellet()); //if eaten we can j cover it w black yktv
        }
      }
    }
  }
  
  
  public void eaten(){
    //if pacman is on it:
    powerNotEaten.remove(0);
    totalScore += value * 5;
    //PowerPellet mode !! <3
  }
}
