class Camera {
  //int x;
  int y;
  
  int currentPos;
  int scrollPos = 30;
  int halfScreen;
  
  Camera(int y){
    //this.x=x;
    this.y=y;
    this.halfScreen = currentPos = 800 / 30 / 2;
  }
}