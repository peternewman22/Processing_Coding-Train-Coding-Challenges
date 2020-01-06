/* 
Physics Engine: apply gravity force to a particle class
A FireworkShow object contains a bunch of fireworks.
Fireworks are made up of particles.

First, I just want to get ONE firework happening. 
THEN I can work on gettings others
*/

ArrayList<Firework> fireworksShow;
PVector gravity;

void settings(){
  size(640, 360);
}

void setup(){
  stroke(255);
  strokeWeight(3);
  fireworksShow = new ArrayList<Firework>();
  gravity = new PVector(0, 0.2);

 }

void draw(){
  background(0);
  
  for (Firework f : fireworksShow){
    f.update();
    f.show();
  }
}
