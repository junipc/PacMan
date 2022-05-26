String playerName;
int screen = 0;
public Board test = new Board(0);
ArrayList<Pellet> notEaten = new ArrayList<Pellet>();
Keyboard keyIn = new Keyboard();
PacMan p = new PacMan(color(250,250,0),200,200);

void setup(){
  size(1080,920);
}

void draw(){
  background(255);
  test.display();
  if(keyIn.isPressed(Keyboard.K_RT))
  p.move(40,0);
  if(keyIn.isPressed(Keyboard.K_LT))
  p.move(-40,0);
  if(keyIn.isPressed(Keyboard.K_UP))
  p.move(0,-40);
  if(keyIn.isPressed(Keyboard.K_DN))
  p.move(0,40);
  p.display();
  
}

void keyPressed() {
  keyIn.press(keyCode);
}

void keyReleased() {
  keyIn.release(keyCode);
}


void mouseClicked(){

}
