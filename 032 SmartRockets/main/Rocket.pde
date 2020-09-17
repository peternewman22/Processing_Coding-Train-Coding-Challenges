class Rocket {

  PVector pos;
  PVector vel;
  PVector acc;
  int lifeSpan;
  DNA dna;


  Rocket(PVector startingPos, int lifeSpan_) {
    lifeSpan = lifeSpan_;
    pos = startingPos;
    vel = PVector.random2D();
    acc = new PVector(0, 0);
    dna = new DNA(lifeSpan);

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
    fill(255, 150);
    noStroke();
    translate(pos.x, pos.y);
    rotate(vel.heading());
    rectMode(CENTER);
    rect(0, 0, 25, 5);
    popMatrix();
  }
}
