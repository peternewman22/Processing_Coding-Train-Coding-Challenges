class Firework{
  /*
  contains the rocket particle, determines when it's exploded and then controls the aftermath
  */
  Particle p;  
  
  // init
  Firework(){
     p = new Particle(random(width), height);
   
  }
  
  void update(){
    // update the Firework by applying gravity and updating the position of the rocket particle
    p.applyForce(gravity);
    p.update();

  }
  
  void show(){
    // show the particle
    p.show();
  }
  
}
