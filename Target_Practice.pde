Mechanics Mechanics;
PShape Crosshairs,target,Hourglass,L1,L2,L3,L4,P,T1,T2;
float theta,sinTheta,cosTheta,x1,y1,w=width/4,h=height/4;
int scale=50;
Mechanics[] targets = new Mechanics[1];
void setup() {
  size(500,500);
  textSize(48);
  for (int i = 0; i < targets.length; i++) {
    targets[i] = new Mechanics(); 
  }
  Mechanics = new Mechanics();
}

void draw() {
    background(200);
    fill(20,200,50);
    text("Score:",150,50);
    text(50-scale,350,50);
    Mechanics.update();
    Mechanics.display();
    Mechanics.shoot();
     for (int i = 0; i < targets.length; i++) {
    targets[i].display();
}
}

class Mechanics { 
  // Creates motion vectors
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Mechanics() {
    //Creates a new target
    position = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    target = createShape(ELLIPSE,x1,y1,scale,scale);
  } 
  
  void update(){
    // Shapes are created 
    // Motion types are assigned
  PVector cursor = new PVector(mouseX,mouseY);
  PVector acceleration = PVector.sub(cursor,position);
  acceleration.setMag(.25);
  velocity.add(acceleration);
  velocity.limit(5);
  position.add(velocity);
  Crosshairs = createShape(GROUP);
  L1 = createShape(LINE,position.x,position.y-30,position.x,position.y-10);
  L2 = createShape(LINE,position.x,position.y+30,position.x,position.y+10);
  L3 = createShape(LINE,position.x-30,position.y,position.x-10,position.y);
  L4 = createShape(LINE,position.x+30,position.y,position.x+10,position.y);
  P = createShape(POINT,position.x,position.y);
  Crosshairs.addChild(L1);
  Crosshairs.addChild(L2);
  Crosshairs.addChild(L3);
  Crosshairs.addChild(L4);
  Crosshairs.addChild(P);
  shape(Crosshairs);
  Hourglass = createShape(GROUP);  
  T1 = createShape(TRIANGLE,240,235,260,235,250,250);
  T1.setFill(color(255));
  T2 = createShape(TRIANGLE,240,265,250,250,260,265);
  T2.setFill(color(255));
  Hourglass.addChild(T1);
  Hourglass.addChild(T2);
  target = createShape(ELLIPSE,x1,y1,scale,scale);
  }

void display() {
  // Spins the target
  shape(Crosshairs); 
  shape(Hourglass);
  theta = theta + .01;
  sinTheta = sin(theta);
  cosTheta = cos(theta);
  x1=map(cosTheta,-2,2,w,width-w);
  y1=map(sinTheta,-2,2,h,height-h);
  fill(50,150,200);
  shape(target);
}

void shoot(){
  // Reduces the size of the target
  println(" ");
  if (mousePressed == true){
    ellipse(position.x,position.y,10,10);
    if (dist(position.x,position.y,x1,y1)<=scale){
      println("Score!");
      scale = scale - 1;
    }  
    }
}


}
