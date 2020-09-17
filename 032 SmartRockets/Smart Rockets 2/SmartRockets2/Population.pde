class Population {

  int popSize;
  Rocket[] rockets;
  ArrayList<Rocket> matingPool;


  Population(int popSize_) {

    popSize = popSize_;
    rockets = new Rocket[popSize];
    for (int i = 0; i < popSize; i++) {
      rockets[i] = new Rocket();
    }
  }

  void show(int count) {
    for (int i = 0; i < popSize; i++) {
      rockets[i].update(count);
      rockets[i].show();
    }
  }

  ArrayList<Rocket> evaluate() {

    float maxFit = 0;
    for (int i = 0; i < popSize; i++) { //find the max fitness
      rockets[i].calcFitness();
      if (rockets[i].fitness > maxFit) {
        maxFit = rockets[i].fitness;
      }
    }
    //normalise the fitnesses
    for (int i = 0; i < popSize; i++) {
      rockets[i].fitness /= maxFit;
    }

    //use the fitness to add appropriate numbers of that parent to the mating pool
    matingPool = new ArrayList<Rocket>();
    for (int i = 0; i < popSize; i++) {
      float n = rockets[i].fitness * 100;
      for (int j = 0; j < n; j ++) { //if the fitness is 100, it should be in the mating pool 100 times
        matingPool.add(rockets[i]);
      }
    }
    return matingPool;
  }

  void selection() {
    Rocket[] newRockets = new Rocket[popSize];
    for (int i = 0; i < rockets.length; i++) {
      int index = floor(random(matingPool.size()+1));
      DNA parentA_DNA = matingPool.get(index).dna;
      DNA parentB_DNA = matingPool.get(index).dna;
      DNA child_DNA = parentA_DNA.crossover(parentB_DNA);
      newRockets[i] = new Rocket(child_DNA);
    }
    //Note: this does NOT preclude self-mating currrently
  }
}
