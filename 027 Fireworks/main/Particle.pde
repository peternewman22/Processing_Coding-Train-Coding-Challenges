class Particle{
  PVector pos;
  PVector vel;
  PVector acc;
  
  Particle(float x, float y, boolean rocket){
    // if the particle isn't part of the rocket, set it one way
    if (!rocket){
      vel = PVector.random2D();
      vel.mult(random(1,6));
    } else {
      vel = new PVector(0, random(-11, -6));
    }
    
    pos = new PVector(x, y);
    
    acc = new PVector(0, 0);
      
  }
  
  void applyForce(PVector f){
    acc.add(f);
  }
  
  void update(){
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
  }
  
  void show(){
    point(pos.x, pos.y);
  }
  
  
}
