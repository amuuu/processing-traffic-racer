class Camera {
  
  int y;
  int currentPos;
  int scrollPos = 30;
  int halfScreen;
  
  Camera(int y){
    this.y=y;
    this.halfScreen = currentPos = 800 / 30 / 2;
  }
}