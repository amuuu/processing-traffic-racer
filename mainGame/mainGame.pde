final int WIDTH = 600; // screen width
final int HEIGHT = 800; // screen height
final int GRID_SIZE = 30;

Player player;
Road road;
Camera camera;
Menu menu;

boolean playTheGame;
int gameTimesCounter;
boolean collision;
int collisionCounter;

void setup(){

  size(600,800);
  player = new Player(2,6,270,758,50,50,3); //velocity, turning velocity, x, y, height, width, life
  road = new Road();
  road.setupTheRoad(); //for the first time
  camera = new Camera(400); //y
  camera.currentPos = WIDTH/2;  
  menu = new Menu();
  
  playTheGame = false;
  collision = false;
  gameTimesCounter=0;
  collisionCounter=0;
}

void draw(){
  
  background(#FCDEBE);
  
  if(!playTheGame){
    if (gameTimesCounter==0) menu.game_menu();
    else
      if (!collision) menu.pause_menu();
//      else menu.loser_menu(scorekeeper.was_highscore());
  }
  
  
  if (playTheGame) {
    printInfo();
    drawPlayer();
    drawOpponents();
    moveCamera();
    gameTimesCounter++;
    menu.playerIsInMiddleOfTheGame = true;
  }
 
  
}

void keyPressed() {
  
  //println(key);
  if (playTheGame) {
    
    if (key=='a' || key=='A') {
      player.x -= 8; //player.turning_velocity;
      if (player.x<=0) player.x = 0; //-30
    }
    
    if (key=='d' || key=='D') {
      player.x += 8; //player.turning_velocity;
      if (player.x >= WIDTH-player.width) player.x = WIDTH-player.width;
    }
    
    if (key=='p' || key=='P'){
      playTheGame=false;
    }
    
  }
  
  if (!playTheGame) {
    if (key=='o' || key=='O'){
      clear();
      playTheGame=true;
      collision=false;
      collisionCounter=0;
    }
  }
  
  if (key=='q' || key=='Q'){
    exit();
  }
  
}

void printInfo(){
  fill(#000000);
  textSize(15);
  
  text("Score: " + player.score, 20, 30);
}

void drawPlayer(){
  pushMatrix();
  fill(#3C5233);
  noStroke();
  rect(player.x,player.y,player.height,player.width);
  popMatrix();
  player.score++;
}

void drawOpponents(){
  
  fill(#B38A58);
  noStroke();
  for (int i= abs(camera.currentPos - camera.halfScreen), j=0; i < camera.halfScreen + camera.currentPos; i++, j++) {
    if (road.scenery_y.get(i)!=null) {
      
      rect(road.scenery_x.get(i),camera.scrollPos+ j*GRID_SIZE , 20, 20); //camera.scrollPos + road.scenery_y[i]+ j*30
      
      if(checkCollison(i,j)){
        collisionCounter++;
        collision=true;
        playTheGame=false;
        //if(collisionCounter==1) scorekeeper.save_score(player.score);
        clear();
        if(menu.playerIsInMiddleOfTheGame) {player.x+=60; if(player.x>WIDTH-player.width) player.x-=200;}
        //menu.loser_menu(scorekeeper.was_highscore());
        
      }
      
    }
    
  } 
}

void moveCamera(){
  
    camera.scrollPos++;
    if (camera.scrollPos == 60) {
      camera.currentPos--;
      camera.scrollPos = GRID_SIZE;
      if (abs(camera.currentPos) == road.scenery_x.size() - camera.halfScreen) {
        exit();
      }
    }
}

boolean checkCollison(int i, int j){
  
  int x = road.scenery_x.get(i);
  int y = camera.scrollPos+ j*GRID_SIZE;
  boolean x_condition_1 = ((player.x<(x)) && ((player.x + player.width)>(x)));
  boolean x_condition_2 = ((player.x<(x+20)) && ((player.x + player.width)>(x+20)));
  boolean y_condition   = ((player.y<(y+20)) && ((player.y+player.height)>(y+20))); 

  if( (x_condition_1 && y_condition) || (x_condition_2 && y_condition) )
    return true;
  else
    return false;
}


int makeColor(){
  int [] colors = {#0000cc,#d61ed0,#067a29};
  int i = int(random(3));
  return colors[i];
}
