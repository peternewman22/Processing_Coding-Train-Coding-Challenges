class DNA{
  PVector[] genes;
  int lifespan;
  
  DNA(int lifeSpan_){
    lifeSpan = lifeSpan_;
    genes = new PVector[lifespan];
    for(int i = 0; i < lifespan; i++){
      genes[i] = PVector.random2D();
      genes[i].setMag(0.1);
    }
  }
  
}
