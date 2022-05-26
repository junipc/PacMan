String playerName;
int screen = 0;
public Board test = new Board(0);
ArrayList<Pellet> notEaten = new ArrayList<Pellet>();
Keyboard keyIn = new Keyboard();

void setup(){
  size(1080,920);
}

void draw(){
  test.display();
}

void keyPressed() {
  keyIn.press(keyCode);
}

void keyReleased() {
  keyIn.release(keyCode);
}


void mouseClicked(){

}
