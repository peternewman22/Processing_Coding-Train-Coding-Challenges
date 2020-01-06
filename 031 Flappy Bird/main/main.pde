Particle current;
ArrayList<Particle> snowflake;
float r;

void settings(){
  size(720, 720);
}

void setup(){
  r = 5;
  current = new Particle(width/2, random(10), r);
  snowflake = new ArrayList<Particle>();
  
}

void draw(){
  translate(width/2, height/2);
  rotate(PI/6);
  background(0);


  
  while (!current.finished() && !current.intersects(snowflake)){
    current.update();
  }
    snowflake.add(current);
    current = new Particle(width/2, 0, r);
  
  
  for (int i = 0; i < 6; i++){
   rotate(PI/3);
   current.display();
   for (Particle p : snowflake){
      p.display();
   }
  // setting up the reflection
  pushMatrix();
    scale(1, -1);
    current.display();
    for (Particle p : snowflake){
      p.display();
    }
  popMatrix();
  } 
}
