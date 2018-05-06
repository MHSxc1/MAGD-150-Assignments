float theta, cosTheta, sinTheta,rotationSpeed;
float x, y, w, h, a, b;


void setup(){
  surface.setResizable(true);
  surface.setTitle("Sine and Cosine");
  pixelDensity(displayDensity());
  size(500,500);
  background(0);
  noStroke();
  w = h = max(width,height) *0.125;
  rotationSpeed = 0.025;
}

void draw(){
  fill(0);
  rect(0,0,width,height);
  theta=theta+map(frameCount%100,0,100,rotationSpeed,rotationSpeed);
  cosTheta = cos(theta);
  sinTheta = sin(theta);
  x = map(cosTheta,-1,1,w,width-w);
  y = map(sinTheta,-1,1,h,height-h);
  a=x+50;
  b=y+50;
  fill(50,200,200);
  ellipse(x,y,w,h);
  
  fill(120);
  ellipse(a,b,20,20);
  fill(255,255,0);
  ellipse(width/2,height/2,100,100);
  if (keyPressed==true){
    if (key=='w'){
      rotationSpeed=rotationSpeed*1.05;
    } else if (key=='s'){
      rotationSpeed=rotationSpeed/1.05;
    } else if (key==ENTER);
    fill(0);
    ellipse(a,b,20,20);
  }
}

void mousePressed(){
  
    rotationSpeed=-rotationSpeed;
  }
