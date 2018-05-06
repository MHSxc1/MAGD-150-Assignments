import processing.pdf.*;
boolean recordScreen;
String fileName;

String[] TitleSlide = {
  "The One...    The Only...", 
};
String fontFile = "MarkerFelt-wide-48.vlw";
String sourceFile = "box_dude.txt";

PFont Zapfino, MarkerFelt; 
float x,w,a=300,b=350; 
int index = 0, counter = 0, size = 48;
PShape BoxDude, Body, T1, T2;

void setup() {
  size(600, 750);
  fileName = "BoxDude.saved.PDF";
  rectMode(CENTER);
  Zapfino = createFont(PFont.list()[726], 32);
  MarkerFelt = createFont(PFont.list()[455], 48);
  x = width;
}

void draw() {
  background(20,100,200);
  if (recordScreen) {
    beginRecord(PDF, fileName +".pdf");
  }
  fill(0);
  textFont(Zapfino, 32);
  textAlign (CENTER);
  text(TitleSlide[index], x+300, height-50); 
  x = x - 3;
  float w = textWidth(TitleSlide[index])/2; 
  if (x < -w - 300) {
    x = width;
    counter = -counter;
    counter++;
    index = (index + 1) % TitleSlide.length; 
  }
  if (counter > 0){
    flash();
  }
  BoxDude();
  Move();
  if (recordScreen) {
    endRecord();
    recordScreen = false;
  }
}

void mousePressed(){
  recordScreen = true;
}

void flash(){
  textFont(MarkerFelt, size);
  fill(255,50,100);
  text("BOX DUDE!!",(width/2),height/3);
  size = size + 3;
  if (size == 96){
    size = 48;
  }
}

void BoxDude(){
    BoxDude = createShape(GROUP);
  fill(255,0,0);
  Body = createShape(RECT,a,b,100,40);
  fill(255);
  T1 = createShape(RECT,a-25,b+25,25,25);
  fill(255);
  T2 = createShape(RECT,a+25,b+25,25,25);
  BoxDude.addChild(Body);
  BoxDude.addChild(T1);
  BoxDude.addChild(T2);
}

void Move(){
  a = a + random(-3,3);
  b = b + random(-3,3);
  if (a<100){
    a = 100;
  }
  if (a>500){
    a = 500;
  }
  if (b<300){
    b = 234;
  }
  if (b>400){
    b = 400;
  }
  shape(BoxDude);
}

String loadString(String filePath, String delimiter) {
  String[] lines = loadStrings(filePath);
  StringBuilder sbuilder = new StringBuilder();
  for (int i = 0, size = lines.length; i < size; ++i) {
    sbuilder.append(lines[i]);
    sbuilder.append(delimiter);
  }
  return sbuilder.toString();
}
