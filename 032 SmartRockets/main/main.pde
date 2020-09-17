Population population;
int count;
int popSize;
int lifeSpan;
PVector target;

void setup(){
  size(1000,1000);
  popSize = 50;
  lifeSpan = 200;
  population = new Population(popSize, lifeSpan);
  count = 0;
  textAlign(CENTER);
  textSize(50);
  target = new PVector(width/2, 300);
}

void draw(){
  background(0);
  population.draw(count);
  fill(255);
  text(str(count), 100, 100);
  count ++;
  if(count == lifeSpan){
    population = new Population(popSize, lifeSpan);
    count = 0;
  } 
}
