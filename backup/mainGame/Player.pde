class Player extends Car {
  int acceleration;
  int life;
  int turning_velocity;
  
  Player(int velocity, int turning, int x, int y, int height, int width, int life){
    super(velocity,x,y,height,width);
    this.acceleration = 0;
    this.life = life;
    this.turning_velocity = turning;
    
  }
  
  void move(){
    y -= velocity;
  }
}