import de.bezier.data.sql.*;

final int WIDTH = 600; // screen width
final int HEIGHT = 800; // screen height
final int GRID_SIZE = 30;

Player player;
Road road;
Camera camera;
ScoreKeeper scorekeeper;
MySQL db;
Menu menu;

boolean playTheGame;
int gameTimesCounter;

void setup(){

  size(600,800);
  player = new Player(2,6,270,758,50,50,3); //velocity, turning velocity, x, y, height, width, life
  road = new Road();
  road.setupTheRoad(); //for the first time
  camera = new Camera(400); //y
  camera.currentPos = WIDTH/2;  
  db = new MySQL(this, "localhost:3306", "gamescores", "root", "amirreza");
  scorekeeper = new ScoreKeeper(db);
  menu = new Menu();
  
  playTheGame = false;
  gameTimesCounter=0;
}

void draw(){
  
  background(230);
  
  if(!playTheGame){
    if (gameTimesCounter==0)
      menu.game_menu();
     else
      menu.loser_menu(scorekeeper.was_highscore());
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
    }
  }
  
  if (key=='q' || key=='Q'){
    exit();
  }
  
}

void printInfo(){
  fill(#000000);
  textSize(32);
  
  text("score: " + player.score, 50, 50);
}

void drawPlayer(){
  pushMatrix();
  fill(#201e23);
  rect(player.x,player.y,player.height,player.width);
  popMatrix();
  player.score++;
}

void drawOpponents(){
  
  fill(#0000cc);
  for (int i= abs(camera.currentPos - camera.halfScreen), j=0; i < camera.halfScreen + camera.currentPos; i++, j++) {
    if (road.scenery_y.get(i)!=null) {
      
      rect(road.scenery_x.get(i),camera.scrollPos+ j*GRID_SIZE , 20, 20); //camera.scrollPos + road.scenery_y[i]+ j*30
      
      if(checkCollison(i,j)){
        playTheGame=false;
        scorekeeper.save_score(player.score);
        clear();
        if(menu.playerIsInMiddleOfTheGame) {player.x+=20;}
        menu.loser_menu(scorekeeper.was_highscore());
        
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

  if( (x_condition_1 && y_condition) || (x_condition_2 && y_condition) ) {
    return true;
  }
  else
    return false;
}


int makeColor(){
  int [] colors = {#0000cc,#d61ed0,#067a29};
  int i = int(random(3));
  return colors[i];
}