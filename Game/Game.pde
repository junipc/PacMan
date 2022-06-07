String playerName;
int screen = 1;
public Board test = new Board(0);
int totalScore = 0;
int levelScore = 0;
int startingPellets = 206; //208 if powerpellets switch back for demo
Keyboard keyIn = new Keyboard();
int readyTime = 5000;
int setUpTime;
int counter = 5;
int level = 1;
PacMan p = new PacMan(color(250,250,0),540,580);
Blinky g1 = new Blinky(color(250,0,0), 460, 460, p.speed);
//Blinky g2 = new Blinky(color(250,0,0), 500, 460);
//Blinky g3 = new Blinky(color(250,0,0), 580, 460);
//Blinky g4 = new Blinky(color(250,0,0), 620, 460);
boolean firstTime = false;
int lives = 3;
boolean ghostsCanMove = true;
float doIt = 0;
color[] pacManCustom = new color[]{color(250,250,0), color(250, 120, 0), color(250, 0, 0), color(0, 250, 0), color(0,0,250), color(75,0,130), color(148,0,211)};
int pcustomIndex = 0;
PShape triangle1; //pacman customize button 1
//Portal tester = new Portal(4,4,8,8);
//int MODE; //(classic/surv)
boolean fright = false;

void setup(){
  size(1080,920);
  setUpTime = millis();
  // start screen shenanigans
}

void draw(){
  if (screen == 0){ //CLASSIC
    if (firstTime == true){
      setUpTime = millis();
      firstTime = false;
      test = new Board(0);
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
      g1.move(p,test);
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
    g1.display();
    //g2.display();
    //g3.display();
    //g4.display();
    if (startingPellets == 0){
      if (level == 10){
        level = 0;
        screen = 2;
      }
      else{
        level++;
        startingPellets = 206; //208 if powerPellets r removed for demo
        p = new PacMan(pacManCustom[pcustomIndex],540,580);
        g1 = new Blinky(color(250,0,0), 460, 460, p.speed);
        //g2 = new Blinky(color(250,0,0), 500, 460);
        //g3 = new Blinky(color(250,0,0), 580, 460);
        //g4 = new Blinky(color(250,0,0), 620, 460);
        setUpTime = millis();
        test = new Board(0);
      }
   }else if(p.deathTimer == 0){
     if(lives == 0){
       level = 1;
       screen = 3;
     }else{
       lives --;
       totalScore -= levelScore;
       levelScore = 0;
     }
     ghostsCanMove = true;
     startingPellets = 206;
     p = new PacMan(pacManCustom[pcustomIndex],540,580);
     g1 = new Blinky(color(250,0,0), 460, 460, p.speed);
     //g2 = new Blinky(color(250,0,0), 500, 460);
     //g3 = new Blinky(color(250,0,0), 580, 460);
     //g4 = new Blinky(color(250,0,0), 620, 460);
     setUpTime = millis();
     test = new Board(0);
   }
   //tester.displayp1();
   //tester.displayp2();
   //tester.teleport();
  }
  if (screen == 1){//START
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
    fill(110,110,251);
    rect(430, 400, 215, 60);
    fill(250,0,0);
    text("SURVIVAL *doesnt work yet*", 460, 440);
    fill(250,250,0);
    arc(670,530,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
    arc(405,530,33,33,QUARTER_PI+PI, 2*PI-QUARTER_PI+PI);
    fill(110,110,251);
    rect(430, 500, 215, 60);
    fill(250,0,0);
    text("CUSTOMIZE", 448, 540);
    fill(110,110,251);
    rect(430, 600, 215, 60);
    fill(250,0,0);
    text("CUSTOMIZE", 448, 640);
    //
    fill(250,0,0);
    int x = 670;
    int y = 630;
    arc(x,y,30,30,PI,2*PI,OPEN);
    rect(x-15,y,30,12);
    line(x-15,y,x-15,y+12);
    line(x+15,y,x+15,y+12);
    triangle(x-15,y+12,x-10,y+12,x-15,y+18);
    triangle(x-10,y+12,x,y+12,x-5,y+18);
    triangle(x,y+12,x+10,y+12,x+5,y+18);
    triangle(x+15,y+12,x+10,y+12,x+15,y+18);
    //
    x = 405;
    y = 630;
    noStroke();
    fill(250,0,0);
    arc(x,y,30,30,PI,2*PI,OPEN);
    rect(x-15,y,30,12);
    line(x-15,y,x-15,y+12);
    line(x+15,y,x+15,y+12);
    triangle(x-15,y+12,x-10,y+12,x-15,y+18);
    triangle(x-10,y+12,x,y+12,x-5,y+18);
    triangle(x,y+12,x+10,y+12,x+5,y+18);
    triangle(x+15,y+12,x+10,y+12,x+15,y+18);
  }
  if (screen == 2){//WIN
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
  if (screen == 3){//LOSE
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
  if (screen == 4){ //CUSTOMIZE PACMAN
    // take color here, tell them red is default; use triangle on screen keys to switch between colors yk
    // to switch colors, pacman goes big in mid of screen then smaller as it switches to next, which becomes bigger
    background(0);
    fill(152,152,156);
    //triangle1 = new PShape(PShape.PATH);
    ////add it's vertices
    //triangle1.vertex(200+580,400);
    //triangle1.vertex(200+580+87,450);
    //triangle1.vertex(200+580,500);
    //fill(152,152,156);
    //beginShape(TRIANGLE);
    //vertex(triangle1.getVertex(0).x, triangle1.getVertex(0).y);
    //vertex(triangle1.getVertex(1).x, triangle1.getVertex(1).y);
    //vertex(triangle1.getVertex(2).x, triangle1.getVertex(2).y);
    //endShape(CLOSE);
    rect(200+580, 400, 100, 100);
    rect(180, 400, 100, 100);
    fill(pacManCustom[pcustomIndex]);
    arc(535,450,150,150,QUARTER_PI, 2*PI-QUARTER_PI);
    PFont font;
    font = createFont("emulogic.ttf", 128);
    textFont(font);
    textSize(15);
    fill(255,128,0);
    if (pcustomIndex == 0){
      text("Default", 470, 365);
    }
    text("next", 800, 455);
    text("back", 200, 455);
    text("Press the Space key to return to the start screen", 160, 600);
  }
  if (screen == 5){ //CUSTOMIZE GHOST
    
  }
  if (screen == 6){//SURVIVAL
     background(255);
     test = new Board(1);
     test.display();
     p = new PacMan(color(250,250,0),60,60);
     g1 = new Blinky(color(250,0,0), 1020, 860, p.speed);
     p.display();
     g1.display();
     p.move(test);
     g1.move(p, test);
  } 

  
  
}

void keyPressed() {
  keyIn.press(keyCode);
  if ((screen == 2 || screen == 3 || screen == 4 || screen == 5) && key == ' '){
    screen = 1;
    totalScore = 0;
    levelScore = 0;
    lives = 3;
  }
}

void keyReleased() {
  keyIn.release(keyCode);
}


void mouseClicked(){
  if (screen == 1 && mouseX > 430 && mouseX < 430+215 && mouseY > 300 && mouseY < 300+60){ //to CLASSIC
    firstTime = true;
    //MODE = 0;
    screen = 0;
  }
  if (screen == 1 && mouseX > 430 && mouseX < 430+215 && mouseY > 500 && mouseY < 500+60){//to PACMAN CUSTOMIZE
    screen = 4;
  }
  if (screen == 4 && mouseX > 180 && mouseX < 280 && mouseY > 400 && mouseY < 500){
    if (pcustomIndex == 0){
      pcustomIndex = pacManCustom.length - 1;
    }
    else{
      pcustomIndex--;
    }
    p = new PacMan(pacManCustom[pcustomIndex],540,580);
  }
  if (screen == 4 && mouseX > 780 && mouseX < 880 && mouseY > 400 && mouseY < 500){
    if (pcustomIndex == pacManCustom.length - 1){
      pcustomIndex = 0;
    }
    else{
      pcustomIndex++;
    }
    p = new PacMan(pacManCustom[pcustomIndex],540,580);
  }
  if (screen == 1 && mouseX > 430 && mouseX < 430+215 && mouseY > 400 && mouseY < 400+60){
    //MODE = 1; //surv
    screen = 6; //or 0
  }
  
  
  //if(screen == 4 && triangle1.contains(mouseX,mouseY)){
  //  fill(152,152,156);
  //}else{
  //  fill(255,0,0);
  //}
}
