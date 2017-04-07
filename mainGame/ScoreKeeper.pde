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
  
  void print_scores(){
    scores_list = see_scores();
    for (int i=0; i<scores_list.size();i++) {
      fill(#000000);
      textSize(15);
      text("player " + i + ": " + scores_list.get(i), 50, 50+2*i);
    }
  }

  
}

//SELECT COUNT(*) FROM fooTable;