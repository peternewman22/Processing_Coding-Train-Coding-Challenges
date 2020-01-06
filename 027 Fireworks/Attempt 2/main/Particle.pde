class Particle{
  PVector pos;
  PVector vel;
  PVector acc;
  
  //constructor
   Particle(float x, float y){
     pos = new PVector(x, y);
     vel = new PVector(0, random(-12, -8));
     acc = new PVector(0, 0);
         
   }
   
   void update(){
     vel.add(acc);
     pos.add(vel);
     acc.mult(0);
   
   }
   
   void applyForce(PVector f){
     acc.add(f);
   }
   
   void show(){
     point(pos.x, pos.y);
   }
  
}
