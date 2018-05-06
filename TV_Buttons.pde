PShape Screen;
PShape Tv;
PShape PowerButton;
PShape ChannelButton;
boolean Power = false;
boolean Channel = false;
int a=5;
int d=3;
int w=20;
int h=20;
float r=255;
float g=255;
float b=255;
int x=250;
int y=250;

void setup(){
  size(500,500);
  background(50,200,200);
  frameRate(5);
  strokeWeight(1);
  line(125,75,250,125);
  line(250,125,375,75);
  rectMode(CENTER);
  ellipseMode(CENTER);
  Tv = createShape(RECT,250,250,width/2,height/2);
  Tv.setFill(150);
  Tv.setStroke(true);
  Screen = createShape(RECT,250,250,width/3,height/3);
  Screen.setFill(0);
  Screen.setStroke(true);
  PowerButton = createShape(ELLIPSE,350,225,25,25);
  PowerButton.setFill(color(255,50,0));
  PowerButton.setStroke(true);
  ChannelButton = createShape(RECT,350,275,25,25);
  ChannelButton.setFill(color(0,50,255));
  ChannelButton.setStroke(true);
}

void draw(){
  shape(Tv);
  shape(Screen);
  shape(PowerButton);
  shape(ChannelButton);
  textSize(12);
  text("Power",335,210);
  textSize(10);
  text("Channel",335,260);
  update();
  tvOff();
  tvOn();
  tvSleep();
  println("C",Channel,"P",Power);
}

void update(){
  if (mousePressed == true){
    if (dist(mouseX,mouseY,350,225) <= 12.5 && Power == false){
      Power = true;
    } else if (dist(mouseX,mouseY,350,225) <= 12.5 && Power == true){
      Power = false;
  } if (dist(mouseX,mouseY,350,275) <=12.5 && Power == true){
    Channel = true;
  } 
 }
}

void tvOff(){
  if (Power == false){
    Screen.setFill(0);
  }
}

void tvOn(){
  if (Power == true){
    Screen.setFill(255);
  }
}

void tvSleep(){
  if (Power == true && Channel == true){
    Screen.setFill(100);
    Screensaver();  
 }
}
 
void Screensaver(){
  fill(r,g,b);
  textSize(14);
  text("DVD",x,y);
   x=x+a;
   y=y+d;
   
    
  if (x>=(width/2)+(width/6)-20){
    a=-a;
    r=random(0,255);
    g=random(0,255);
    b=random(0,255);
  } 
  if (x<=(width/2)-(width/6)){
    a=-a;
    r=random(0,255);
    g=random(0,255);
    b=random(0,255);
  }
  if (y>=(height/2)+(height/6)+8){
    d=-d;
    r=random(0,255);
    g=random(0,255);
    b=random(0,255);
  }
  if (y<=(height/2)-(height/6)+10){
    d=-d;
    r=random(0,255);
    g=random(0,255);
    b=random(0,255);
  }  
}
