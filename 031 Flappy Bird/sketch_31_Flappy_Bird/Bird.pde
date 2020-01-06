class Bird{
  float x, y, gravity, velocity, lift; 
  
  Bird(){
    y = height/2;
    x = width/8;
    gravity = 1;
    velocity = 0;
    lift = -15;
  }
  
  void show(){
    ellipse(x, y, 60, 60);
  }
  
  void update(){
    velocity += gravity;
    //velocity *= 0.9;
    y += velocity;
    
    //lower edge condition
    if (y > height){
      y = height;
      velocity = 0;
    }
    
    //upper edge condition
    if (y < 0 ){
      y = 0;
      velocity = 0;
    }    
  }
  
  void up(){
    velocity += gravity*lift;

  }
  
  
}
