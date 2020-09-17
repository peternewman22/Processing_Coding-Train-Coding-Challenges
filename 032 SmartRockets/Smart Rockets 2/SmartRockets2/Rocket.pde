class Rocket {

  PVector pos, vel, acc;
  DNA dna;
  float fitness;
  

  Rocket() {

    pos = new PVector(width/2, height);
    vel = PVector.random2D();
    acc = new PVector(0, 0);
    dna = new DNA();
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update(int count) {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    applyForce(dna.genes[count]);
  }

  void show() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(255, 150);
    noStroke();
    rotate(vel.heading());
    rect(0, 0, 25, 5);
    popMatrix();
  }
  
  void calcFitness(){
    float d = dist(pos.x, pos.y, target.x, target.y);
    fitness = map(d, 0, width, width, 0);
  }
  
}
