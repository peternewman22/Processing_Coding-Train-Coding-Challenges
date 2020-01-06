/*
For each frame:
  10% chance, create a new rocket (fireworks)
  Fireworks:
    starts with a particle at a random width and with random velocity
    at the zenith, the initial particle disappears and is replaced with 100 new particles
    new particles have random vector
*/

PVector gravity;
ArrayList<Firework> fireworks;

void settings(){
  size(400, 300);
}

void setup(){
  stroke(255);
  strokeWeight(4);
  
  gravity = new PVector(0, 0.2);
  fireworks = new ArrayList<Firework>();
  
}

void draw(){
  background(0);
  
  
  //let there be a 10% chance of making a new firework
  if (random(1) < 0.1){
    fireworks.add(new Firework());
  }
  for (int i = 0; i < fireworks.size(); i++){
    fireworks.get(i).update();
    fireworks.get(i).show();
  } 
}
