class Menu{
  
  boolean playerIsInMiddleOfTheGame;
  Menu(){
    this.playerIsInMiddleOfTheGame=false;
  }
  void game_menu(){
    fill(#000000);
    textSize(70);
    text("Welcome!", 100, HEIGHT/2-100);
    textSize(20);
    text("press 'o' to start the game!", 100, HEIGHT/2);
    text("press 'p' to pause the game!", 100, HEIGHT/2+50);
    text("press 'q' to quit the game!", 100, HEIGHT/2+100);
  }
  
  void loser_menu(boolean wasHighscore){
    fill(#000000);
    if(wasHighscore) {
      textSize(50);
      text("NEW HIGHSCORE!!", 100, HEIGHT/2-200);
    }
    else {
      textSize(50);
      text("SORRY :(", 100, HEIGHT/2-200);
    }
    textSize(30);
    text("your score: " + player.score,100, HEIGHT/2-150);
    text("you lost! wanna try again?", 100, HEIGHT/2-100);
    textSize(20);
    text("press 'o' to start the game!", 100, HEIGHT/2+50);
    text("press 'q' to quit the game!", 100, HEIGHT/2+100);
    
    //scorekeeper.print_scores();
  }
}