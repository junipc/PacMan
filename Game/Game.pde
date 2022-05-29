String playerName;
int screen = 2;
public Board test = new Board(0);
ArrayList<Pellet> notEaten = new ArrayList<Pellet>();
int startingPellets = 206; //208 if powerpellets switch back for demo
Keyboard keyIn = new Keyboard();
PacMan p = new PacMan(color(250,250,0),540,580);
ArrayList<PowerPellet> powerNotEaten = new ArrayList<PowerPellet>();
Blinky b1 = new Blinky(color(250,0,0), 460, 460);
Blinky b2 = new Blinky(color(250,0,0), 500, 460);
Blinky b3 = new Blinky(color(250,0,0), 580, 460);
Blinky b4 = new Blinky(color(250,0,0), 620, 460);
int readyTime = 5000;
int setUpTime;
int counter = 5;
int level = 1;

void setup(){
  size(1080,920);
  setUpTime = millis();
  // start screen shenanigans
}

void draw(){
  if (screen == 0){
    background(255);
    int passedTime = millis() - setUpTime;
    test.display();
    PFont font;
    font = createFont("emulogic.ttf", 128);
    textFont(font);
    textSize(12);
    fill(255,128,0);
    if (passedTime <= 1000) {
      text("READY! " + counter, 490, 345);  
    }
    else if (passedTime <= 2000) {
      text("READY! " + (counter-1), 490, 345);
    }
    else if (passedTime <= 3000) {
      text("READY! " + (counter-2), 490, 345);
    }
    else if (passedTime <= 4000) {
      text("READY! " + (counter-3), 490, 345);
    }
    else if (passedTime <= 5000) {
      text("READY! " + (counter-4), 490, 345);
    }
    else if (passedTime > readyTime) {
      passedTime = 6000;
      p.move(test);
    }
    p.display();
    textSize(12);
    fill(255);
    text("SCORE:" + test.score, 20, 20);
    text("LEVEL:" + level, 900, 20);
    text("SP" + startingPellets, 500, 20);
    b1.display();
    b2.display();
    b3.display();
    b4.display();
    if (startingPellets == 0){
      level++;
      if (level == 10){
        screen = 2;
      }
      else{
        startingPellets = 206;
        p = new PacMan(color(250,250,0),540,580);
        b1 = new Blinky(color(250,0,0), 460, 460);
        b2 = new Blinky(color(250,0,0), 500, 460);
        b3 = new Blinky(color(250,0,0), 580, 460);
        b4 = new Blinky(color(250,0,0), 620, 460);
        setUpTime = millis();
        test = new Board(0);
      }
   }
  }
  if (screen == 1){
   //start screen
  }
  if (screen == 2){
    background(0);
    PFont font;
    font = createFont("emulogic.ttf", 128);
    textFont(font);
    textSize(35);
    fill(255,128,0);
    text("CONGRATS ON BEATING CLASSIC", 50, 200); // BEATING + mode when survival mode exists
    text("MODE WITH A WHOPPING SCORE", 70, 300);
    text("OF " + test.score + "!", 375, 400);
    textSize(15);
    text("Press the Space key to return to the start screen", 75, 600);
  }
  
  
}

void keyPressed() {
  keyIn.press(keyCode);
  if (screen == 2 && key == ' '){
    screen = 0;
    test.score = 0;
  }
}

void keyReleased() {
  keyIn.release(keyCode);
}


void mouseClicked(){

}
