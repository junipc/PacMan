String playerName;
int screen = 0;

PacMan p = new PacMan(color(255,255,0),100,100);
void setup(){
size(1080,920);
background(255);
}

void draw(){
  p.move(0,1);
  p.display();
}

void keyPressed(){

}

void mouseClicked(){

}
