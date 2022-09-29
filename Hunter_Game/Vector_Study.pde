int nMover = 150;
Mover[] m =  new Mover[150];
boolean clicked = false;

void setup()
{
  size(800,600);
  //fullScreen();
  for(int i = 0; i < m.length; i = i + 1)
  
  {
    m[i] = new Mover();
  }
}

void draw()
{
  noStroke();
  fill(0,0,0,10);
  rect(0,0,width,height);
  for(int i = 0; i < m.length; i = i + 1)
  {
    m[i].update();
    m[i].check();
    m[i].display();
  }
  drawMe();
}

void drawMe()
{
  noStroke();
  fill(250,10,250,40);
  circle(mouseX,mouseY,45);
}

void mousePresed()

{
  for(int i = 0; i < m.length; i = i + 1)
  {
  m[i].bite(mouseX,mouseY);
  }
}
