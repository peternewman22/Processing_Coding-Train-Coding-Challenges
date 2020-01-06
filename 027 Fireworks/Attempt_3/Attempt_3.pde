/* 
Particle class tracks whether or not it's done
*/ 

PVector gravity;


ArrayList<Firework> FireworkShow;

void settings(){
   size(640, 360);
}

void setup(){
  //create an arraylist filled with fireworks
  FireworkShow = new ArrayList<Firework>();
  gravity = new PVector(0, 0.2);
  colorMode(HSB);
  
  stroke(255);
  strokeWeight(3);
  background(0);
}

void draw(){
  background(0,0,0,25); //this gives the background a bit of alpha so that you see the previous frames
  
  //3% of the time, create a new Firework
  if (random(1) < 0.03){
    FireworkShow.add(new Firework());
  }
  
  //loop through the Fireworks, but backwards because we remove fireworks once they're dead
  for (int i = FireworkShow.size() - 1; i > 0 ; i--){
    if (!FireworkShow.get(i).finished){
      FireworkShow.get(i).update(gravity);
      FireworkShow.get(i).show();
    } else { 
      FireworkShow.remove(i);
    }
  }
}
