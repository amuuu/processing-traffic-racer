class Road {
  
  ArrayList <Integer> scenery_x = new ArrayList<Integer>();
  ArrayList <Integer> scenery_y = new ArrayList<Integer>();
  
   
  void setupTheRoad(){
    int x = 0;
    for (int i = 0; i < 100000; i++) {
      if (random(1) > 0.5) x = int(random(100,2000)%600);
      while (x==0 || x>530) x = int(random(0,2000))%550;
      if(i!=0) while (scenery_x.get(i-1).equals(x)) x = int(random(0,2000))%550;
      scenery_x.add(x);
      //println(scenery_x.get(i));
    }
    
    for (int i = 0; i < 100000; i++) {
      if (random(1) > 0.85)
        scenery_y.add(int(random(0, 800)));
    }
   
    
    
    
  }
}