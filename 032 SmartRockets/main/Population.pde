class Population{
  Rocket[] rockets;
  int popSize;
  int lifeSpan;
  
  Population(int popSize_, int lifeSpan_){
    lifeSpan = lifeSpan_;
    popSize = popSize_;
    rockets = new Rocket[popSize];
    for(int i = 0; i < popSize; i++){
      rockets[i] = new Rocket(new PVector(width/2, height), lifeSpan);
    }
  }
  
  void draw(int count){
    for(int i = 0; i < rockets.length; i++){
      rockets[i].update(count);
      rockets[i].show();
    }
  }
}
