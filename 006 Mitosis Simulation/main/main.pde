ArrayList<Cell> cells;
Cell cell;


void settings(){
  size(640, 360);
}

void setup(){
  cells = new ArrayList<Cell>();
  cells.add(new Cell());
}

void draw(){
  background(51);
  for (int i = 0; i < cells.size(); i++){
    cells.get(i).move();
    cells.get(i).display();
  }
}

  
void mousePressed(){
  for (int i = 0; i < cells.size(); i++){
    if (cells.get(i).clicked(mouseX, mouseY)){
      cells.get(i).mitosis();
    } else {
    
    }
}
  
}
