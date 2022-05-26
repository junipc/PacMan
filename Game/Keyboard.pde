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
    if(code == LEFT)
    inputs[K_LT] = true;
    if(code == RIGHT)
    inputs[K_RT] = true;
    if(code == UP)
    inputs[K_UP] = true;
    if(code == DOWN)
    inputs[K_DN] = true;
  }
  void release(int code){
    println(code);
    if(code == LEFT)
    inputs[K_LT] = false;
    if(code == RIGHT)
    inputs[K_RT] = false;
    if(code == UP)
    inputs[K_UP] = false;
    if(code == DOWN)
    inputs[K_DN] = false;
  }
  
}
