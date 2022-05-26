public class Keyboard{
  static final int LT = 0;
  static final int RT = 1;
  static final int UP_ = 2;
  static final int DN = 3;
  boolean[]inputs;
  
  public Keyboard(){
    inputs = new boolean[4];
  }
  
  boolean isPressed(int code){
    return inputs[code];
  }
  void press(int code){
    println(code);
    if(code == LEFT)
    inputs[LT] = true;
    if(code == RIGHT)
    inputs[RT] = true;
    if(code == UP)
    inputs[UP_] = true;
    if(code == DOWN)
    inputs[DN] = true;
  }
  
}
