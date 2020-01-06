float b;
float a;
float n;
float tracker;
//import controlP5.*;

//ControlP5 MyController;
//int R, G, B;


void settings(){
  size(720, 720, P2D);
}

void setup(){
  //MyController = new ControlP5(this);
  //MyController.addSlider("n", 0, 10, 10, 20, 100, 100, 10);
  stroke(255);
  noFill();
  b = 100;
  a = 100;
  n = 0; //MyController.getController("n").getValue();
  tracker = 0;
  //R = 40;
  //G = 200;
  //B = 200;
  
  // A.addSlider("text", min, max, starting value, loc.x, loc.y, width, height
}

void draw(){
  background(0);
  translate(width/2, height/2);
  
  //float r = 100;
  
  beginShape();
  for (float angle = 0; angle < TWO_PI; angle+= 0.001){
    //float x = r * cos(a);
    //float y = r * sin(a);
    float na = 2/n;
    float x = pow(abs(cos(angle)), na) * a * sgn(cos(angle));
    float y = pow(abs(sin(angle)), na) * b * sgn(sin(angle));
    vertex(x, y);
    } 
  endShape(CLOSE);
  
  // I just want it to cycle through the ten and then turn around again
  tracker += 0.05;
  n += sgn(sin(tracker)) * 0.05;
  
  
}


float sgn(float val){
  if(val > 0){
    return 1;
  } else if (val < 0){
    return -1;
  } else {
    return 0;    
  }
  
}
