Snow[] s;
int count ;
int t=0;
void setup(){
  size(500,500);
  background(0);
  frameRate(60);
  count = 500;
  s = new Snow[count];
  for(int i=0; i < count; i++) {
    s[i] = new Snow();
    // Makes an array of snowflakes
  }
}

void draw(){
  for(int i=0; i < count; i++) {
    s[i].draw();
    // Draws multiple arrays
  }
}

class Snow {
  float x,y,radius=10;
  color fill;
  Snow() {
    this(random(30,height-30), 
      random(30,height-30), 
      random(5, 30));
  }
  Snow(float x, float y, float radius){
    this.x = x;
    this.y = y;
    fill = color(random(0,50),random(50,100),random(200,255));
  }
void draw(){
  flakes();
  fill(fill);
  ellipse(x,y,radius,radius);
  // Draws the snowflakes
}


void flakes(){
  for(y++;y>490;y++){
    ellipse(x,y,radius,radius);
    y=50;
    // Makes the snowflakes fall
}
}
}
