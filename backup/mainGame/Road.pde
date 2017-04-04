class Road {
  
  int[] scenery_x = new int[100000];
  int[] scenery_y = new int[100000];
  
  
   
  void setupTheRoad(){
    int x = 0;
    for (int i = 0; i < scenery_x.length; i++) {
      if (random(1) > 0.5)
         x = int(random(100,2000)%600);
         while (x==0 || x>530)
           x = int(random(0,2000))%550;
         if(i!=0) while (scenery_x[i-1]==x) x = int(random(0,2000))%550;
         //if(i!=0) while (scenery_x[i-1]-x>
         scenery_x[i] = x;
        println(scenery_x[i]);
    }
    
    for (int i = 0; i < scenery_y.length; i++) {
      if (random(1) > 0.85)
        scenery_y[i] = int(random(0, 800));
    }
   
    
    
    
  }
}