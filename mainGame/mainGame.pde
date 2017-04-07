final int WIDTH = 600; // screen width
final int HEIGHT = 800; // screen height
final int GRID_SIZE = 30;

Player player;
Road road;
Camera camera;

void setup(){

  size(600,800);
  player = new Player(2,6,270,758,50,50,3); //velocity, turning velocity, x, y, height, width, life
  road = new Road();
  road.setupTheRoad(); //for the first time
  camera = new Camera(400); //y
  camera.currentPos = WIDTH/2;
  
}

void draw(){
  
  background(230);

  printInfo();
  
  drawPlayer();
  
  drawOpponents();

  moveCamera();
 
}

void keyPressed() {
  
  //println(key);
  if (key=='a' || key=='A') {
    player.x -= 8; //player.turning_velocity;
    if (player.x<=0) player.x = 0; //-30
  }
  
  if (key=='d' || key=='D') {
    player.x += 8; //player.turning_velocity;
    if (player.x >= WIDTH-player.width) player.x = WIDTH-player.width;
  }
  
}

void printInfo(){
  fill(#000000);
  textSize(32);
  text(player.x+ "--- " + camera.scrollPos + "-----" + camera.currentPos, 50, 50);
}

void drawPlayer(){
  pushMatrix();
  fill(#201e23);
  rect(player.x,player.y,player.height,player.width);
  popMatrix();
}

void drawOpponents(){
  
  fill(#0000cc);
  for (int i= abs(camera.currentPos - camera.halfScreen), j=0; i < camera.halfScreen + camera.currentPos; i++, j++) {
    if (road.scenery_y.get(i)!=null) {
      rect(road.scenery_x.get(i),camera.scrollPos+ j*GRID_SIZE , 20, 20); //camera.scrollPos + road.scenery_y[i]+ j*30
    }
    
  } 
}

void moveCamera(){
  
    camera.scrollPos++;
    if (camera.scrollPos == 60) {
      camera.currentPos--;
      camera.scrollPos = GRID_SIZE;
      if (abs(camera.currentPos) == road.scenery_x.size() - camera.halfScreen)
        exit();
    }
}

int makeColor(){
  int [] colors = {#0000cc,#d61ed0,#067a29};
  int i = int(random(3));
  return colors[i];
}