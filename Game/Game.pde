String playerName;
int screen = 1;
public Board test = new Board(1);
int totalScore = 0;
ArrayList<Pellet> notEaten = new ArrayList<Pellet>();
int startingPellets = 206; //208 if powerpellets switch back for demo
Keyboard keyIn = new Keyboard();
ArrayList<PowerPellet> powerNotEaten = new ArrayList<PowerPellet>();
int readyTime = 5000;
int setUpTime;
int counter = 5;
int level = 1;
PacMan p = new PacMan(color(250,250,0),540,580);
Blinky b1 = new Blinky(color(250,0,0), 460, 460, p.speed);
//Blinky b2 = new Blinky(color(250,0,0), 500, 460);
//Blinky b3 = new Blinky(color(250,0,0), 580, 460);
//Blinky b4 = new Blinky(color(250,0,0), 620, 460);
boolean firstTime = false;
int lives = 3;

void setup(){
  size(1080,920);
  setUpTime = millis();
  // start screen shenanigans
}

void draw(){
  if (screen == 0){
    if (firstTime == true){
      setUpTime = millis();
      firstTime = false;
    }
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
      //passedTime = 6000;
      p.move(test);
    }
    if (passedTime > readyTime + 3500) {
      b1.move(p,test);
      //b1.move(test,0);
    }
    if (passedTime > 6000 && passedTime < 7000){
      test.map[9][13] = 4;
    }
    if (passedTime >= 7000 && passedTime < 8000){
      test.map[9][13] = 4;
      //b1 = new Blinky(color(250,0,0), 540, 340);
    }
    if (passedTime >= 8000 && passedTime <= 8500){
      //test.map[9][13] = 1;
    }
    p.display();
    textSize(12);
    fill(255);
    text("SCORE:" + totalScore, 20, 20);
    text("LEVEL:" + level, 900, 20);
    text("SP" + startingPellets, 500, 20);
    text("LIVES", 20, 900);
    fill(250,250,0);
    if(lives > 0)
      arc(110,900,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
    if(lives > 1)
      arc(150,900,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
    if(lives > 2)
      arc(190,900,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
    b1.display();
    //b2.display();
    //b3.display();
    //b4.display();
    if (startingPellets == 0){
      if (level == 10){
        level = 0;
        screen = 2;
      }
      else{
        level++;
        startingPellets = 206; //208 if powerPellets r removed for demo
        p = new PacMan(color(250,250,0),540,580);
        b1 = new Blinky(color(250,0,0), 460, 460, p.speed);
        //b2 = new Blinky(color(250,0,0), 500, 460);
        //b3 = new Blinky(color(250,0,0), 580, 460);
        //b4 = new Blinky(color(250,0,0), 620, 460);
        setUpTime = millis();
        test = new Board(0);
      }
   }else if(p.deathTimer == 0){
     if(lives == 0){
       level = 0;
       screen = 3;
     }else{
       lives --;
     }
     startingPellets = 206;
     p = new PacMan(color(250,250,0),540,580);
     b1 = new Blinky(color(250,0,0), 460, 460, p.speed);
     //b2 = new Blinky(color(250,0,0), 500, 460);
     //b3 = new Blinky(color(250,0,0), 580, 460);
     //b4 = new Blinky(color(250,0,0), 620, 460);
     setUpTime = millis();
     test = new Board(0);
   }
  }
  if (screen == 1){
    background(0);
    PFont font;
    font = createFont("pac-font.ttf", 128);
    textFont(font);
    textSize(65);
    fill(255,255,0);
    text("pac-man", 360, 200); // BEATING + mode when survival mode exists
    font = createFont("emulogic.ttf", 128);
    textFont(font);
    textSize(20);
    text("© 2022 Dot Hoggers", 340, 820);
    text("ALL RIGHTS RESERVED", 332, 880);
    fill(110,110,251);
    rect(430, 300, 215, 60);
    fill(250,0,0);
    text("CLASSIC", 465, 340);
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
    text("OF " + totalScore + "!", 375, 400);
    textSize(15);
    text("Press the Space key to return to the start screen", 100, 600);
  }
  if (screen == 3){
    background(0);
    PFont font;
    font = createFont("emulogic.ttf", 128);
    textFont(font);
    textSize(35);
    fill(255,128,0);
    text("G4M3 0V3R!", 370, 200); // BEATING + mode when survival mode exists
    text("YOUR TOTAL SCORE:" + totalScore, 200, 300);
    textSize(15);
    text("Press the Space key to return to the start screen", 160, 600);
  }
  
  
}

void keyPressed() {
  keyIn.press(keyCode);
  if ((screen == 2 || screen == 3) && key == ' '){
    screen = 1;
    totalScore = 0;
  }
}

void keyReleased() {
  keyIn.release(keyCode);
}


void mouseClicked(){
  if (screen == 1 && mouseX > 430 && mouseX < 430+215 && mouseY > 300 && mouseY < 300+60){
    firstTime = true;
    screen = 0;
  }
}
