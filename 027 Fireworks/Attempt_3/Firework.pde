/*
  This class handles each rocket, go to woe
  At the apex of its flight, the initial rocket particles should disappear
  Replaced by a new array of particles
  */

class Firework{
    Particle p;
    boolean exploded;
    boolean isRocket;
    Particle[] explosion;
    boolean finished;
    float hu;
      

    Firework(){
      //create a particle
      hu = random(255); 
      isRocket = true;
      p = new Particle(random(width), height-20, new PVector(0.0, random(-12, -6)), hu, isRocket);
      exploded = false;
      finished = false;
     
      
      explosion = new Particle[100];
    }
    
    void update(PVector grav){
        // if it's a rocket...
        if (isRocket){
        p.applyForce(grav);
        p.update();
        
        //if its at the apex, disappear and update rocket status
          if (p.vel.y >= 0){
            exploded = true;
            isRocket = false;
            explode();
          }
        } else {
          for (int i = 0; i < explosion.length; i++){
            explosion[i].applyForce(grav);
            explosion[i].update();
            if (explosion[i].done){
              finished = true; //if any of the particles turn up as done, trigger finished on the Firework object
            }
          }
        }
       
        
      }
    
    void show(){
      if (!exploded){
        p.show();
      } else {
        for (int i = 0; i < explosion.length; i++){
          explosion[i].show();
        }
      }
    }
    
    void explode(){        
        // each with a random velocity and with a particular colour and alpha and lifespan
        for (int i = 0; i < 100; i++){
          PVector exp_vel = PVector.random2D();
          exp_vel.mult(random(1,6));
          explosion[i] = new Particle(p.pos.x, p.pos.y, exp_vel, hu, isRocket);
        }
    }
}
