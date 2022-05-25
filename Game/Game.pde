String playerName;
int screen = 0;
public Board test = new Board(0);
ArrayList<Pellet> notEaten = new ArrayList<Pellet>();


void setup(){
  size(1080,920);
  println(test.getMapString());
  test.display();
  //int sideLength = height/23; //shld be 40
  //for (int i = 0; i < 23; i++){ //test, smth seems to not work
  //  for (int j = 0; j < 27; j++){
  //    fill(200,0,255);
  //    square(j*sideLength, i*sideLength, sideLength);
  //  }
  //}
}

void draw(){

}

void keyPressed(){

}

void mouseClicked(){

}
