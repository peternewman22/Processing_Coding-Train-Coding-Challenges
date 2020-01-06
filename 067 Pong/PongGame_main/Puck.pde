class Puck{

  PVector pos;
  PVector vel;
  float D;
  float r;
  float speed;
  
  
  Puck(){
   reset();
  }
  
  void reset(){
   pos = new PVector(width/2, height/2);
   speed = 10;
   //start with a random velocity direction, magnitude 4
   vel = PVector.random2D();
   vel.setMag(speed);
   
   //diametre: height/20
   D = height/20;
   r = D/2;
  }
  
  void update(){
    pos.add(vel);
  }
  
  void show(){
    circle(pos.x, pos.y, D);
  }
  
  void edge(){
    if(pos.y > height - D/2 || pos.y < D/2){
      vel.y *= -1;
    } 
    
    if (pos.x < 0){
      reset();
      rightScore++;
      ding.play();
    }
    
    if (pos.x > width){
      reset();
      leftScore++;
      ding.play();
    }
    
  }
  
  void checkPaddleL(Paddle p){
      if(pos.y < p.y + p.h/2 && //if puck is below the top of the paddle
         pos.y > p.y - p.h/2 && //and above the bottom of the paddle
         pos.x - r < p.x + p.w/2){ //and is inside the paddle's x span
         if (pos.x > p.x){
           float diff = pos.y - (p.y - p.h/2);
           float angle = map(diff, 0, p.h, -PI/4, PI/4);
           vel.x = 5*cos(angle);
           vel.y = 5*sin(angle);
           //vel.x *= -1;
         }
         }
    }
  
  void checkPaddleR(Paddle p){
    if(pos.y < p.y + p.h/2 && //if puck is below the top of the paddle
         pos.y > p.y - p.h/2 && //and above the bottom of the paddle
         pos.x + r > p.x - p.w/2){ //and is inside the paddle's x span
         if (pos.x < p.x){ //to check it's not behind the paddle
           float diff = pos.y - (p.y - p.h/2);
           float angle = map(diff, 0, p.h, 5*PI/4, 7*PI/4);
           vel.x = 5*cos(angle);
           vel.y = 5*sin(angle);
           //vel.x *= -1;
         }
    }
  }
}
