class Particle{
  PVector pos;
  PVector vel;
  PVector acc;
  color c;
  float lifespan;
  boolean isRocket;
  boolean done;
  float hu;
  
  Particle(float x, float y, PVector vel_, float hu_, boolean isRocket_){
    pos = new PVector(x,y);
    vel = vel_.copy();
    acc = new PVector(0, 0);
    lifespan = 255;
    //c = c_;
    isRocket = isRocket_;
    done = false;
    hu = hu_;
    
  }
  
  void update(){
      pos.add(vel);
      vel.add(acc);
      acc.mult(0);
      lifespan -= 4;
      if (lifespan <= 0){
        done = true;
      }
  }
  
  void show(){
    if (isRocket){
      point(pos.x, pos.y);
    } else{
      stroke(hu, 255, 255, lifespan);
      point(pos.x, pos.y);
    }
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
}
