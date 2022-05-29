String playerName;
int screen = 0;
public Board test = new Board(0);
ArrayList<Pellet> notEaten = new ArrayList<Pellet>();
Keyboard keyIn = new Keyboard();
PacMan p = new PacMan(color(250,250,0),220,220);
ArrayList<PowerPellet> powerNotEaten = new ArrayList<PowerPellet>();
Blinky b = new Blinky(color(250,0,0), 220, 700);
int readyTime = 5000;
int setUpTime;
int counter = 5;

void setup(){
  size(1080,920);
  setUpTime = millis();
}

void draw(){
  background(255);
  int passedTime = millis() - setUpTime;
  //if (passedTime > readyTime) {
  //  passedTime = 6000;
  //  p.move(test);
  //}
  test.display();
  if (passedTime <= 1000) {
    textSize(12);
    fill(255);
    text("READY! " + counter, 515, 585);  
  }
  else if (passedTime <= 2000) {
    textSize(12);
    fill(255);
    text("READY! " + (counter-1), 515, 585);
  }
  else if (passedTime <= 3000) {
    textSize(12);
    fill(255);
    text("READY! " + (counter-2), 515, 585);
  }
  else if (passedTime <= 4000) {
    textSize(12);
    fill(255);
    text("READY! " + (counter-3), 515, 585);
  }
  else if (passedTime <= 5000) {
    textSize(12);
    fill(255);
    text("READY! " + (counter-4), 515, 585);
  }
  else if (passedTime > readyTime) {
    passedTime = 6000;
    p.move(test);
  }
  p.display();
  textSize(12);
  fill(255);
  text("SCORE:" + test.score, 20, 20);
  b.display();
  
}

void keyPressed() {
  keyIn.press(keyCode);
}

void keyReleased() {
  keyIn.release(keyCode);
}


void mouseClicked(){

}
