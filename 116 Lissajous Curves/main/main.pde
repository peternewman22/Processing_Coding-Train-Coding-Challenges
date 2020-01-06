float angle, D, w; 
int cols, rows;
Curve[][] curves;

void settings() {
  size(1280, 1280, P2D);
}

void setup() {
  noFill();
  angle = 0;
  w = 80;
  cols = int(width/w);
  rows = int(height/w - 1);
  D = w - 10;
  //new 2D array
  curves = new Curve[rows][cols];
  for (int j = 0 ; j < rows; j++){
   for (int i =0; i < cols; i++){
     curves[j][i] = new Curve();
   }
   }
   
}


void draw() {
  background(0);

  //drawing the cols
  for (int i = 0; i < cols - 1; i++) {
    float cx = w + i * w + w/2;
    float cy = w/2;
    stroke(255);
    strokeWeight(3);
    ellipse(cx, cy, D, D);

    float r = D/2;
    float x = r * cos((i+1) * angle - PI/2);
    float y = r * sin((i + 1)* angle - PI/2);

    strokeWeight(8);
    point(cx + x, cy + y);

    stroke(255, 100);
    strokeWeight(1);
    line(cx + x, 0, cx + x, height);
    
    for (int j = 0; j < rows; j++){
      curves[j][i].setX(cx+x);
    }
  }

  //drawing the rows
  for (int j = 0; j < rows - 1; j++) {
    float cy = w + j * w + w/2;
    float cx = w/2;
    stroke(255);
    strokeWeight(3);
    ellipse(cx, cy, D, D);

    float r = D/2;
    float x = r * cos((j+1) * angle - PI/2);
    float y = r * sin((j + 1)* angle - PI/2);

    strokeWeight(8);
    point(cx + x, cy + y);

    stroke(255, 100);
    strokeWeight(1);
    line(0, cy + y, width, cy+y);
    
    for (int i = 0; i < cols; i++){
      curves[j][i].setY(cy+y);
    }
  }
  
  for (int j = 0 ; j < rows; j++){
   for (int i =0; i < cols; i++){
     curves[j][i].addPoint();
     curves[j][i].show();
   }
   }

  angle -= 0.01;
  if (angle < -TWO_PI){}
}
