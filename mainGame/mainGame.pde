final int WIDTH = 600;
final int HEIGHT = 800;

Manager manager;
Player player;
Road road;
Camera camera;

void setup(){
  
  size(600,800);
  player = new Player(2,6,270,728,80,50,3); //velocity, turning velocity, x, y, height, width, life
  road = new Road();
  road.setupTheRoad();
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
  
  if (key=='a' || key=='A') {
    player.x -= 8; //player.turning_velocity;
    if (player.x<=-30) player.x = -30; //-30
  }
  
  if (key=='d' || key=='D') {
    player.x += 8; //player.turning_velocity;
    if (player.x >= 492) player.x = 492;
  }
  
}

void printInfo(){
  fill(#000000);
  textSize(32);
  text(player.x, 50, 50);
}

void drawPlayer(){
  pushMatrix();
  translate(30, 20);
  fill(0);
  rect(player.x,player.y, player.height, player.width);
  popMatrix();
}

void drawOpponents(){
  
  fill(#0000cc);
  for (int i= camera.currentPos - camera.halfScreen, j=0; i < camera.halfScreen + camera.currentPos; i++, j++) {
    if (road.scenery_y.get(i)!=null) {
      rect(road.scenery_x.get(i), camera.scrollPos+ j*30, 20, 20); //camera.scrollPos + road.scenery_y[i]+ j*30
    }
  } 
}

void moveCamera(){
camera.scrollPos--;
  //scrollPos %= halfScreen;
  if (camera.scrollPos == 0)
  {
    camera.currentPos++;
    camera.scrollPos = 30;
    if (camera.currentPos == road.scenery_x.size() - camera.halfScreen)
      exit(); // End
  }
}