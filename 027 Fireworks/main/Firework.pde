class Firework{
  Particle firework;
  boolean exploded;
  ArrayList<Particle> explosion;
  boolean rocket;
  
  Firework(){
    rocket = true;
    firework = new Particle(random(width), height, rocket);
    exploded = false; // particles don't start exloded
    explosion = new ArrayList<Particle>(); //this houses the particles post zenith
    }
  
  void update(){
    // this gets called for each Firework in the draw loop
    
    // check if it's exploded... if not:
    if (!exploded){
      firework.applyForce(gravity);
      firework.update();
      
      // if it's reached its peak, stop showing the rocket and instead, load the explosion array with particles
      if (firework.vel.y >= 0){
        exploded = true;
        explode();
        }
      } else {
        for (int i = 0; i < explosion.size(); i++){
          explosion.get(i).applyForce(gravity);
          explosion.get(i).update();
          }
        } 
    
    }
  }
  
  void explode(){
    //create an array on the fly of 100 particles at the explosion point
     for (int i = 0; i < 100; i++){
       Particle p = new Particle(firework.pos.x, firework.pos.y, false);
       explosion.add(p);
     }
  }
  
  void show(){
    // if not exploded, show the particle moving up
    if (!exploded){
      firework.show();
    }
    for (int i = 0; i < explosion.size(); i++){
      explosion.get(i).show();
    }
  }
  
