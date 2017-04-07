class ScoreKeeper {

  MySQL db;
  ArrayList<Integer> scores_list = new ArrayList<Integer>();

  ScoreKeeper (MySQL db) {
    this.db = db;
  }
  
  void save_score(int score){
    if(db.connect()){
      db.execute("INSERT INTO scores VALUES ("+score+")");
    }
    else {
      println("not connected to database");
    }
  }
  
  ArrayList<Integer> see_scores(){
    if (db.connect()){
        db.query("SELECT score FROM scores");
        while(db.next()){
          scores_list.add(db.getInt("score"));
        }
    }
    else {
      println("not connected to database");
    }
    
    if (scores_list.size()!=0) 
        return scores_list;
    else 
        return null;
  }
  
  boolean was_highscore(){
    scores_list = see_scores();
    boolean isHighscore = false;
    for (int i=0; i<scores_list.size()-1;i++) {
      //fill(#000000);
      //textSize(15);
      //text("player " + i + ": " + scores_list.get(i), 50, 50+2*i);
      if(player.score<scores_list.get(i)){
        isHighscore=false;
        break;
      }
    }
    return isHighscore;
  }

  
}

//SELECT COUNT(*) FROM fooTable;
//text(player.x+ "--- " + camera.scrollPos + "-----" + camera.currentPos, 50, 50);