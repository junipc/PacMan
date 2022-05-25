String playerName;
int screen = 0;


void setup(){
size(1080,920);
background(255);
Ghost g1 = new Blinky(color(200,200,0),100,100);
g1.display();
PacMan p = new PacMan(color(255,255,0),200,100);
p.display();
}

void draw(){

}

void keyPressed(){

}

void mouseClicked(){

}
