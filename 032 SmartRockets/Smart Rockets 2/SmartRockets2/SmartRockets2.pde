Population population;
int lifeSpan, count, popSize;
PVector target;

void setup(){
  size(750, 750);
  lifeSpan = 300;
  popSize = 50;
  population = new Population(popSize);
  count = 0;
  textAlign(CENTER);
  textSize(20);
  target = new PVector(width/2, 100);
}

void draw(){
  background(0);
  text(count, 50, 50);
  fill(255);
  ellipse(target.x, target.y, 20, 20);
  population.show(count);
  count ++;
  if(count == lifeSpan){
    population = new Population(popSize);
    count = 0;
  }
  
  
  
  
  
  
}
