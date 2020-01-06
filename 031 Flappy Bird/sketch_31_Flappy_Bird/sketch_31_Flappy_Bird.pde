/*
Draw bird on left side of screen
Apply Gravity
Draw a dynamic series of rectangles, with a gap top and bottom
When the space key is pressed, a upwards velocity is applied to the bird
*/
Bird b;
//boolean jumping;
ArrayList<Wall> walls;
Wall w;

void settings(){
  size(720, 960);
}

void setup(){
  b = new Bird();
  noStroke();
  fill(255);
  walls = new ArrayList<Wall>();
  walls.add(new Wall()); // start with one wall
  
  //jumping = false;
}

void draw(){
  background(0);
  b.update();
  b.show();
  
  // every 200 frames, add a new wall
  if (frameCount %150 == 0){
   walls.add(new Wall());
   String s = "wall added at " + frameCount;
   println(s);
  }
  
  //go through the list of walls and update and display them
  for (int i = walls.size() - 1; i > 0; i--){
      //update and show
      walls.get(i).update();
      walls.get(i).show();
     /*
     // if hits bird...
     if (walls.get(i).hits(b)){
       String s = "HIT!";
       println(s);
     }
     */
     
     // if offscreen, remove from array
      if (walls.get(i).done){
      walls.remove(i);
      String s = "wall removed";
      println(s);
      }
    } 
  }
  



void keyPressed(){
  if (key == ' '){
    b.up();
  }
}

/*
void keyPressed(){
  if (key == TAB){
    jumping  = true;
  }
}

void keyReleased(){
  if (key == TAB){
    jumping = false;
  }
}
*/
