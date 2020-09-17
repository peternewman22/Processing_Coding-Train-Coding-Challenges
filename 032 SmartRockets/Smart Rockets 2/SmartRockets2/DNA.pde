class DNA {

  PVector[] genes;


  DNA(PVector[] genes_) {
    if (genes != null) {
      genes = genes_;
    } else {
      genes = new PVector[lifeSpan];
      //init random array of PVectors
      for (int i = 0; i < lifeSpan; i++) {
        genes[i] = PVector.random2D();
        genes[i].setMag(0.1);
      }
    }
  }

  DNA crossover(DNA partner) {
    PVector[] newGenes = new PVector[lifeSpan];
    int mid = floor(random(genes.length));
    for (int i = 0; i < genes.length; i++) {
      if (i > mid) {
        newGenes[i] = genes[i];
      } else {
        newGenes[i] = partner.genes[i];
      }
    }
    return new DNA(newGenes);
  }
}
