class Particle{

    float r;
    PVector pos;
    float wanderWidth;
    
    //constructor
    Particle(float x_, float y_, float r_){
      pos = new PVector(x_, y_);
      r = r_;
      wanderWidth = 3;
    }
    
    void update(){
      pos.x -= 1;
      pos.y += random(-1*wanderWidth, wanderWidth);
      
      float angle = pos.heading();
      angle = constrain(angle, 0, PI/6);
      
      
      //constraining the angle by making a new vector
      float magnitude = pos.mag();
      pos = PVector.fromAngle(angle);
      pos.setMag(magnitude);
    }

    void display(){
      fill(255);
      ellipse(pos.x,pos.y,r,r);
      
    }
    
    boolean finished(){
      return(pos.x < 1);
    }
    
    boolean intersects(ArrayList<Particle> snowflake){
      boolean result = false;
      for (Particle s : snowflake){
        float d = dist(s.pos.x, s.pos.y, pos.x, pos.y);
         // r*2 makes the particles stop short. Change later? 
        if (d < r){
          result = true;
          break;
        }
      }
      return result;
    }
}
