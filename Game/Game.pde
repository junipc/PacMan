String playerName;
int screen = 1;
public Board test = new Board(0);
int totalScore = 0;
int startingPellets = 203; //203
Keyboard keyIn = new Keyboard();
final int readyTime = 5000;
int setUpTime;
int counter = 5;
int level = 1; //1
PacMan p = new PacMan(color(250,250,0),540,500);
Blinky g1 = new Blinky(color(250,0,0), 540, 340, p.speed*.95);
Pinky g2 = new Pinky(color(255, 184, 255), 500, 420, p.speed*.95);
Inky g3 = new Inky(color(0, 255, 255), 580, 420, p.speed*.95); //at 30
Clyde g4 = new Clyde(color(255, 184, 82), 620, 420,  p.speed*.95); // at 60 eaten
Stinky g5 = new Stinky(color(223, 0, 254), 460, 420, p.speed*.95);// Stinky at 90 eaten
boolean firstTime = true;
int lives = 4; //4
boolean ghostsCanMove = true;
color[] pacManCustom = new color[]{color(250,250,0), color(250, 120, 0), color(250, 0, 0), color(0, 250, 0), color(0,0,250), color(75,0,130), color(148,0,211)};
int pcustomIndex = 0;
boolean fright = false;
float frightTimer = 0;
boolean scatter = true;
float gSpeed;
float tempTimer = 0;
boolean stinky = false;
boolean alreadyPortal = false; //survival
int eatStreak = 0;
int kp;
float kx;
float ky;
int killingTimer;
int cherryTimer;
boolean firstCherrySpawned;
boolean secondCherrySpawned;
int eatenCherryTimer;
Portal added;
boolean levelUp = false; //survival

void setup(){
  size(1080,920);
  setUpTime = millis();
}

void draw(){
  if (screen == 0){ //CLASSIC
    if(killingTimer > 0){
      if(killingTimer == 30){
        fill(0,255,255);
        textSize(10);
        textAlign(CENTER);
        text(kp,kx,ky);
      }
      killingTimer--;
    }else{
    if (firstTime == true){
      setUpTime = millis();
      firstTime = false;
      scatter = true;
      frightTimer = 0;
      cherryTimer = 0;
      test.map[12][13] = 2;
      test.map[9][13] = 1;
      p = new PacMan(pacManCustom[pcustomIndex],540,500);
      g1 = new Blinky(color(250,0,0), 540, 340, p.speed*.95);
      g2 = new Pinky(color(255, 184, 255), 500, 420, p.speed*.95);
      g3 = new Inky(color(0, 255, 255), 580, 420, p.speed*.95); //at 30
      g4 = new Clyde(color(255, 184, 82), 620, 420,  p.speed*.95); // at 60 eaten
      g5 = new Stinky(color(223, 0, 254), 460, 420, p.speed*.95);
    }
    background(255);
    int passedTime = millis() - setUpTime;
    test.display();
    PFont font;
    font = createFont("emulogic.ttf", 128);
    textAlign(LEFT);
    textFont(font);
    textSize(12);
    fill(255,128,0);
    if (passedTime <= 1000) {
      text("READY! " + counter, 490, 385);  
    }
    else if (passedTime <= 2000) {
      text("READY! " + (counter-1), 490, 385);
    }
    else if (passedTime <= 3000) {
      text("READY! " + (counter-2), 490, 385);
    }
    else if (passedTime <= 4000) {
      text("READY! " + (counter-3), 490, 385);
    }
    else if (passedTime <= 5000) {
      text("READY! " + (counter-4), 490, 385);
    }
    else if (passedTime > 5000) {
      //passedTime = 6000;
      p.move(test);
      g1.move(p, test);
    }
    if (passedTime > 5000 + 3000) {
      g2.move(p,test);
      if (startingPellets <= 203 - 30){
        test.map[9][13] = 4; //for some time
        g3.move(p,test);
      }
      if (startingPellets <= 203 - 60){
        test.map[9][13] = 4; //for some time
        g4.move(p, test);
      }
      if (startingPellets <= 203 - 90 && stinky){
        test.map[9][13] = 4; //for some time
        g5.move(p, test);
      }
    }
    if (passedTime >= 7000 && passedTime < 13000){
      test.map[9][13] = 4;
    }
    scatterToggle(passedTime);
    if(frightTimer > 0){
      frightTimer--;
    }
    if(frightTimer == 0){
      fright = false;
      frightTimer = -1;
    }
    if(cherryTimer > 0){
      cherryTimer--;
    }
    if(cherryTimer == 0){
      test.map[12][13] = 2;
    }
    if(cherryTimer == 0 && startingPellets == 203 - 70 && ! firstCherrySpawned){
      test.map[12][13] = 5;
      cherryTimer = 999;
      firstCherrySpawned = true;
    }
    if(cherryTimer == 0 && startingPellets == 203 - 170 && ! secondCherrySpawned){
      test.map[12][13] = 5;
      cherryTimer = 999;
      secondCherrySpawned = true;
    }
    if(eatenCherryTimer > 0){
      eatenCherryTimer--;
      textAlign(CENTER);
      fill(255);
      textSize(12);
      text(100*level, 13*40+20, 12*40+24);
      textAlign(LEFT);
    }
    
    p.display();
    textSize(12);
    fill(255);
    text("SCORE:" + totalScore, 20, 20);
    text("LEVEL:" + level, 900, 20);
    text(startingPellets + " PELLETS", 500, 20);
    text("LIVES", 20, 900);
    fill(250,250,0);
    if(lives > 0)
      arc(110,900,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
    if(lives > 1)
      arc(150,900,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
    if(lives > 2)
      arc(190,900,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
    if(lives > 3)
      arc(230,900,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
    g1.display();
    g2.display();
    g3.display();
    g4.display();
    if (stinky){
      g5.display();
    }
    if (startingPellets == 0){
      if (level == 10){
        level = 1;
        screen = 2;
      }
      else{
        level++;
        startingPellets = 203;
        p = new PacMan(pacManCustom[pcustomIndex],540,500);
        if(level <= 4)
          gSpeed = p.speed * .90;
        else if(level <= 6)
          gSpeed = p.speed * .95;
        else
          gSpeed = p.speed;
        g1 = new Blinky(color(250,0,0), 540, 340, gSpeed);
        g2 = new Pinky(color(255, 184, 255), 500, 420, gSpeed);
        g3 = new Inky(color(0, 255, 255), 580, 420, gSpeed); //at 30
        g4 = new Clyde(color(255, 184, 82), 620, 420,  gSpeed); // at 60 eaten
        g5 = new Stinky(color(223, 0, 254), 460, 420, p.speed*.95); //at 90
        setUpTime = millis();
        test = new Board(0);
        scatter = true;
        frightTimer = 0;
        cherryTimer = 0;
        firstCherrySpawned = false;
        secondCherrySpawned = false;
      }
   }else if(p.deathTimer == 0){
     if(lives == 0){
       level = 1;
       screen = 3;
     }else{
       lives --;
     }
     p = new PacMan(pacManCustom[pcustomIndex],540,500);
     if(level <= 5)
       gSpeed = p.speed * .95;
     else
       gSpeed = p.speed;
     g1 = new Blinky(color(250,0,0), 540, 340, gSpeed);
     g2 = new Pinky(color(255, 184, 255), 500, 420, gSpeed);
     g3 = new Inky(color(0, 255, 255), 580, 420, gSpeed); //at 30
     g4 = new Clyde(color(255, 184, 82), 620, 420,  gSpeed); // at 60 eaten
     g5 = new Stinky(color(223, 0, 254), 460, 420, p.speed*.95); //at 90
     setUpTime = millis();
     scatter = true;
     frightTimer = 0;
     firstTime = true;
     ghostsCanMove = true;
   }
  }
  }
  if (screen == 1){//START
    background(0);
    PFont font;
    font = createFont("pac-font.ttf", 128);
    textFont(font);
    textSize(65);
    fill(255,255,0);
    text("pac-man", 360, 200); 
    font = createFont("emulogic.ttf", 128);
    textFont(font);
    textSize(20);
    text("?? 2022 Dot Hoggers", 340, 820);
    text("ALL RIGHTS RESERVED", 332, 880);
    fill(110,110,251);
    rect(430, 300, 215, 60);
    fill(250,0,0);
    text("CLASSIC", 465, 340);
    fill(110,110,251);
    rect(430, 400, 215, 60);
    fill(250,0,0);
    text("SURVIVAL", 460, 440);
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
    text("CONGRATS ON BEATING THIS", 50, 200); 
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
    text("G4M3 0V3R!", 370, 200);
    text("YOUR TOTAL SCORE:" + totalScore, 200, 300);
    textSize(15);
    text("Press the Space key to return to the start screen", 160, 600);
  }
  if (screen == 4){ //CUSTOMIZE PACMAN
    background(0);
    fill(152,152,156);
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
    background(0);
    PFont font;
    font = createFont("emulogic.ttf", 128);
    textFont(font);
    textSize(15);
    fill(76,76,78);
    rect(160, 465, 300, 60);
    rect(590, 465, 300, 60);
    fill(255,128,0);
    text("Are you up for the challenge?", 320, 200);
    text("GIVE ME STINKY!", 200, 500);
    text("No Stinky (default)", 600, 500);
    text("Press the Space key to return to the start screen", 160, 800);
    int x;
    int y = 350;
    if (stinky){
      fill(223, 0, 254);
      x = 310;
      arc(x,y,30*3,30*3,PI,2*PI,OPEN);
      rect(x-15*3,y,30*3,12*3);
      line(x-15*3,y,x-15*3,y+12*3);
      line(x+15*3,y,x+15*3,y+12*3);
      triangle(x-15*3,y+12*3,x-10*3,y+12*3,x-15*3,y+18*3);
      triangle(x-10*3,y+12*3,x,y+12*3,x-5*3,y+18*3);
      triangle(x,y+12*3,x+10*3,y+12*3,x+5*3,y+18*3);
      triangle(x+15*3,y+12*3,x+10*3,y+12*3,x+15*3,y+18*3);
      
      x = 740;
      fill(250,0,0,100);
      circle(x, y+10, 130);
      fill(0);
      circle(x, y+10, 110);
      fill(223, 0, 254, 100);
      arc(x,y,30*3,30*3,PI,2*PI,OPEN);
      rect(x-15*3,y,30*3,12*3);
      line(x-15*3,y,x-15*3,y+12*3);
      line(x+15*3,y,x+15*3,y+12*3);
      triangle(x-15*3,y+12*3,x-10*3,y+12*3,x-15*3,y+18*3);
      triangle(x-10*3,y+12*3,x,y+12*3,x-5*3,y+18*3);
      triangle(x,y+12*3,x+10*3,y+12*3,x+5*3,y+18*3);
      triangle(x+15*3,y+12*3,x+10*3,y+12*3,x+15*3,y+18*3);
      fill(250,0,0,40);
      translate(width/2, height/2);
      rotate(PI/3.0);
      rect(-50, -225, 120, 10);
    }
    
    if (!stinky){
      fill(223, 0, 254, 100);
      x = 310;
      arc(x,y,30*3,30*3,PI,2*PI,OPEN);
      rect(x-15*3,y,30*3,12*3);
      line(x-15*3,y,x-15*3,y+12*3);
      line(x+15*3,y,x+15*3,y+12*3);
      triangle(x-15*3,y+12*3,x-10*3,y+12*3,x-15*3,y+18*3);
      triangle(x-10*3,y+12*3,x,y+12*3,x-5*3,y+18*3);
      triangle(x,y+12*3,x+10*3,y+12*3,x+5*3,y+18*3);
      triangle(x+15*3,y+12*3,x+10*3,y+12*3,x+15*3,y+18*3);
      
      x = 740;
      fill(250,0,0);
      circle(x, y+10, 130);
      fill(0);
      circle(x, y+10, 110);
      fill(223, 0, 254);
      arc(x,y,30*3,30*3,PI,2*PI,OPEN);
      rect(x-15*3,y,30*3,12*3);
      line(x-15*3,y,x-15*3,y+12*3);
      line(x+15*3,y,x+15*3,y+12*3);
      triangle(x-15*3,y+12*3,x-10*3,y+12*3,x-15*3,y+18*3);
      triangle(x-10*3,y+12*3,x,y+12*3,x-5*3,y+18*3);
      triangle(x,y+12*3,x+10*3,y+12*3,x+5*3,y+18*3);
      triangle(x+15*3,y+12*3,x+10*3,y+12*3,x+15*3,y+18*3);
      fill(250,0,0);
      translate(width/2, height/2);
      rotate(PI/3.0);
      rect(-50, -225, 120, 10);  
    }
  }
  if (screen == 6){//SURVIVAL
    if (firstTime == true){
      lives = 1;
      scatter = false;
      setUpTime = millis();
      alreadyPortal = false;
      firstTime = false; 
      test = new Board(1);
      p = new PacMan(pacManCustom[pcustomIndex],60,60);
      g1 = new Blinky(color(250,0,0), 1020, 860, p.speed*.95);
      g2 = new Pinky(color(255, 184, 255), 1020, 740, p.speed*.95);
      g3 = new Inky(color(0, 255, 255), 900, 860, p.speed*.95); //at 30
      g4 = new Clyde(color(255, 184, 82), 1020, 620,  p.speed*.95); // at 60 eaten
      g5 = new Stinky(color(223, 0, 254), 780, 860, p.speed*.95); //at 90
    }

    background(255);
    int passedTime = millis() - setUpTime;
    background(255);
    test.display();
    PFont font;
    font = createFont("emulogic.ttf", 128);
    textAlign(LEFT);
    textFont(font);
    textSize(12);
    fill(255,128,0);
     if (passedTime <= 1000) {
       text("READY! 5", 490, 385);  
     }
     else if (passedTime <= 2000) {
       text("READY! 4", 490, 385);
     }
     else if (passedTime <= 3000) {
       text("READY! 3", 490, 385);
     }
     else if (passedTime <= 4000) {
       text("READY! 2", 490, 385);
     }
     else if (passedTime <= 5000) {
       text("READY! 1", 490, 385);
     }
     else if (passedTime > 5000 && lives != 0) {
       if(passedTime < 5500)
         ghostsCanMove = true;
       p.move(test);
       g1.move(p, test);
       g2.move(p, test);
       g3.move(p, test);
       g4.move(p, test);
       if (stinky){
         g5.move(p, test);
       }
     }
     int prevLevel = level;
     if (passedTime >= 30*1000+5000 && passedTime < 60*1000+5000){
       level = Math.max(prevLevel, 2);
       if (prevLevel != level){
         levelUp = true;
       }
     }
     else if (passedTime >= 60*1000+5000 && passedTime < 90*1000+5000){
       level = Math.max(prevLevel,3);
       if (prevLevel != level){
         levelUp = true;
       }     
     }
     else if (passedTime >= 90*1000+5000 && passedTime < 120*1000+5000){
       level = Math.max(prevLevel,4);
       if (prevLevel != level){
         levelUp = true;
       }       
     }
     else if (passedTime >=120*1000+5000 && passedTime < 150*1000+5000){
       level = Math.max(prevLevel,5);
       if (prevLevel != level){
         levelUp = true;
       } 
     }
     else if (passedTime >= 150*1000+5000 && passedTime < 180*1000+5000){
       level = Math.max(prevLevel,6);
       if (prevLevel != level){
         levelUp = true;
       } 
     }
     else if (passedTime >= 180*1000+5000 && passedTime < 210*1000+5000){
       level = Math.max(prevLevel,7);
       if (prevLevel != level){
         levelUp = true;
       } 
     }
     else if (passedTime >= 210*1000+5000 && passedTime < 240*1000+5000){
       level = Math.max(prevLevel,8);
       if (prevLevel != level){
         levelUp = true;
       } 
     }
     else if (passedTime >= 240*1000+5000 && passedTime < 270*1000+5000){
       level = Math.max(prevLevel,9);
       if (prevLevel != level){
         levelUp = true;
       } 
     }
     else if (passedTime >= 270*1000+5000 && passedTime < 300*1000+5000){
       level = Math.max(prevLevel,10);
       if (prevLevel != level){
         levelUp = true;
       } 
     }
     if (passedTime > 300*1000+5000 || level > 10){
       level = 1;
       firstTime = true;
       screen = 2;
       test.noPelletsForSurvival.clear();
     }
     if (levelUp){
       g1.speed *= 1.1;
       g2.speed *= 1.1;
       g3.speed *= 1.1;
       g4.speed *= 1.1;
       if (stinky){
         g5.speed *= 1.1;
       }
       p.speed *= 1.07;
       levelUp = false;
     }
     if (p.deathTimer > 0)
       ghostsCanMove = false;
     if (p.deathTimer == 0){ 
       lives--;
       level = 1;
       firstTime = true;
       screen = 3;
       test.noPelletsForSurvival.clear();
     }
     p.display();
     g1.display();
     g2.display();
     g3.display();
     g4.display();
     if (stinky){
       g5.display();
     }
     totalScore = Math.max(0,passedTime/1000 -5);
     fill(255);
     text("LEVEL:" + level, 900, 20);
     text("SCORE:" + totalScore, 20, 20);
     text("LIVES", 20, 900);
     fill(250,250,0);
     if(lives > 0){
      arc(110,900,33,33,QUARTER_PI, 2*PI-QUARTER_PI);
     }
     if (passedTime >= 5000){
       if (!alreadyPortal){
         int index1 = (int)(Math.random() * test.noPelletsForSurvival.size());
         int index2 = (int)(Math.random() * test.noPelletsForSurvival.size());
         while (index1 == index2){
          index2 = (int)(Math.random() * test.noPelletsForSurvival.size());
         }
        added = new Portal(test.noPelletsForSurvival.get(index1)[0], test.noPelletsForSurvival.get(index1)[1], test.noPelletsForSurvival.get(index2)[0], test.noPelletsForSurvival.get(index2)[1]);
        alreadyPortal = true;
       }
       if (alreadyPortal && !added.canUse){
          alreadyPortal = false;
       }
       added.displayp1();
       added.displayp2();
       added.teleport();
     }
  } 

  
  
}

void scatterToggle(int passedTime){
  if(level == 1){
    if(passedTime < 7000+5000 ||
      (passedTime >= 27000+5000 && passedTime < 34000+5000) ||
      (passedTime >= 54000+5000 && passedTime < 59000+5000) ||
      (passedTime >= 79000+5000 && passedTime < 84000+5000))
    {
      scatter = true;
    }else{
      scatter = false;
    }
  }
  if(level >= 2 && level <= 4){
    if(passedTime < 7000+5000 ||
      (passedTime >= 27000+5000 && passedTime < 34000+5000) ||
      (passedTime >= 54000+5000 && passedTime < 59000+5000))
    {
      scatter = true;
    }else{
      scatter = false;
    }
  }
  if(level >= 5){
    if(passedTime < 5000+5000 ||
      (passedTime >= 25000+5000 && passedTime < 30000+5000) ||
      (passedTime >= 50000+5000 && passedTime < 55000+5000))
    {
      scatter = true;
    }else{
      scatter = false;
    }
  }
}

void keyPressed() {
  keyIn.press(keyCode);
  if ((screen == 2 || screen == 3 || screen == 4 || screen == 5) && key == ' '){
    screen = 1;
    totalScore = 0;
    lives = 4;
  }
  if(screen == 0 && (key == 'p' || key == 'P')){
    startingPellets = 0;
  }
  if(screen == 6 && (key == 'p' || key == 'P')){
    level++;
    g1.speed *= 1.1;
    g2.speed *= 1.1;
    g3.speed *= 1.1;
    g4.speed *= 1.1;
    if (stinky){
      g5.speed *= 1.1;
    }
    p.speed *= 1.07;
    levelUp = false;
  }
}

void keyReleased() {
  keyIn.release(keyCode);
}


void mouseClicked(){
  if (screen == 1 && mouseX > 430 && mouseX < 430+215 && mouseY > 300 && mouseY < 300+60){ //to CLASSIC
    firstTime = true;
    lives = 4;
    screen = 0;
    startingPellets = 203;
    p = new PacMan(pacManCustom[pcustomIndex],540,500);
    if(level <= 4)
      gSpeed = p.speed * .90;
    else if(level <= 6)
      gSpeed = p.speed * .95;
    else
      gSpeed = p.speed;
    g1 = new Blinky(color(250,0,0), 540, 340, gSpeed);
    g2 = new Pinky(color(255, 184, 255), 500, 420, gSpeed);
    g3 = new Inky(color(0, 255, 255), 580, 420, gSpeed); //at 30
    g4 = new Clyde(color(255, 184, 82), 620, 420,  gSpeed); // at 60 eaten
    g5 = new Stinky(color(223, 0, 254), 460, 420, p.speed*.95); //at 90
    setUpTime = millis();
    test = new Board(0);
    scatter = true;
    frightTimer = 0;
    cherryTimer = 0;
    firstCherrySpawned = false;
    secondCherrySpawned = false;
    ghostsCanMove = true;
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
    p = new PacMan(pacManCustom[pcustomIndex],540,500);
  }
  if (screen == 4 && mouseX > 780 && mouseX < 880 && mouseY > 400 && mouseY < 500){
    if (pcustomIndex == pacManCustom.length - 1){
      pcustomIndex = 0;
    }
    else{
      pcustomIndex++;
    }
    p = new PacMan(pacManCustom[pcustomIndex],540,500);
  }
  if (screen == 1 && mouseX > 430 && mouseX < 430+215 && mouseY > 400 && mouseY < 400+60){
    firstTime = true;
    lives = 1;
    screen = 6;  
  }
  
  if (screen == 1 && mouseX > 430 && mouseX < 430+215 && mouseY > 600 && mouseY < 600+60){
    screen = 5; 
  }
  
  if (screen == 5 && mouseX > 160 && mouseX < 160+300 && mouseY > 465 && mouseY < 465+60){
    stinky = true;
  }
    if (screen == 5 && mouseX > 590 && mouseX < 590+300 && mouseY > 465 && mouseY < 465+60){
    stinky = false;
  }
}
