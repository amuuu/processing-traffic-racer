class Player extends Car {
  int acceleration;
  int life;
  int turning_velocity;
  int score;
  
  Player(int velocity, int turning, int x, int y, int height, int width, int life){
    super(velocity,x,y,height,width);
    this.acceleration = 0;
    this.life = life;
    this.turning_velocity = turning;
    this.score=0;
    
  }
  
  void move(){
    y -= velocity;
  }
}