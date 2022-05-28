String playerName;
int screen = 0;
public Board test = new Board(0);
ArrayList<Pellet> notEaten = new ArrayList<Pellet>();
Keyboard keyIn = new Keyboard();
PacMan p = new PacMan(color(250,250,0),220,220);
ArrayList<PowerPellet> powerNotEaten = new ArrayList<PowerPellet>();
Blinky b = new Blinky(color(250,0,0), 220, 200);

void setup(){
  size(1080,920);
}

void draw(){
  background(255);
  test.display();
  p.move(test);
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
