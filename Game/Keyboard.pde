public class Keyboard{
  static final int K_LT = 0;
  static final int K_RT = 1;
  static final int K_UP = 2;
  static final int K_DN = 3;
  boolean[]inputs;
  
  public Keyboard(){
    inputs = new boolean[4];
  }
  
  boolean isPressed(int code){
    return inputs[code];
  }
  void press(int code){
    println(code);
    if(code == LEFT || code == 'A' || code == 'a')
    inputs[K_LT] = true;
    if(code == RIGHT || code == 'D' || code == 'd')
    inputs[K_RT] = true;
    if(code == UP || code == 'W' || code == 'w')
    inputs[K_UP] = true;
    if(code == DOWN || code == 'S' || code == 's')
    inputs[K_DN] = true;
  }
  void release(int code){
    println(code);
    if(code == LEFT || code == 'A' || code == 'a')
    inputs[K_LT] = false;
    if(code == RIGHT || code == 'D' || code == 'd')
    inputs[K_RT] = false;
    if(code == UP || code == 'W' || code == 'w')
    inputs[K_UP] = false;
    if(code == DOWN || code == 'S' || code == 's')
    inputs[K_DN] = false;
  }
  
}
