String playerName;
int screen = 0;


void setup(){
size(1080,920);
background(255);
Ghost g1 = new Blinky(color(200,200,0),100,100);
g1.display();
PacMan p = new PacMan(color(255,255,0),200,100);
p.display();
PacMan p1 = new PacMan(color(255,255,0),200,150);
p1.setDir(1);
p1.display();
PacMan p2 = new PacMan(color(255,255,0),200,200);
p2.setDir(2);
p2.display();
PacMan p3 = new PacMan(color(255,255,0),200,250);
p3.setDir(3);
p3.display();
PacMan p4 = new PacMan(color(255,255,0),200,300);
p4.setDir(0);
p4.display();
}

void draw(){

}

void keyPressed(){

}

void mouseClicked(){

}
