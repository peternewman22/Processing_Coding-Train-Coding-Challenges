class Cell{
  PVector loc;
  float r;
  color c;
  
  //init
  Cell(PVector loc, float r, float c){
    loc = loc || new PVector(random(width), random(height)); // start at random
    r = r || 40;
    c = c || color(random(100, 255), 0, random(100, 255));     
  }
  
  void move(){
    PVector vel = PVector.random2D();
    loc.add(vel);
  }
  
  void display(){
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, 2*r, 2*r);
  }
  
  boolean clicked(int x, int y){
    float d = dist(loc.x, loc.y, x, y);
    if (d < r){
      return true;
    } else {
      return false;
    }
  }
  
  void mitosis(){
    Cell cell = new Cell(loc, r/2, c);
    return cell;
  }
}
