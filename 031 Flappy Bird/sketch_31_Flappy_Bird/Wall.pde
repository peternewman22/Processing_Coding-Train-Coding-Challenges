class Wall{
  float top, bottom, x, w, speed;
  boolean done;
  
  Wall(){
    top = random(height/2);
    bottom = random(height/2);
    x = width;
    w = 40;
    speed = 3;
    done = false;
  }
  
  void show(){
    rect(x, 0, w, top); //start off screen
    rect(x, height - bottom, w, bottom); // start off screen
  }
  
  void update(){
   x -= speed;
   if (x + w < 0){
     done = true;
   }
  }
  /*
  boolean hits(Bird bird){
    if (bird.x > x && bird.x < x+w){
      if (bird.y < top || bird.y > height-bottom){
        return true;
      }
    } else {
        return false;
      }   
    
  }
  */
}
