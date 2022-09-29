class Mover
{
  PVector location = new PVector(0,0);
  PVector velocity = new PVector(0,0);
  PVector acceleration1 = new PVector(0.01,0.03);
  PVector acceleration2 = new PVector(0.01,0.03);
  float max_speed = random(1,5);
  float max_acc = random(0.1,0.3);
  boolean live = true;
  
  
  Mover()
  {
    this.location.x = random(width);
    this.location.y = random(height);
  }
  
  void update() 
  {
    if(live)
    {
      PVector mouse = new PVector(mouseX,mouseY);
      PVector dir = PVector.sub(mouse,location);
      float dist = dir.mag();
      if(dist < 30) this.live = false; //if catched
      dir.normalize();
      dir.mult(max_acc);
      acceleration1=dir; //chasing mouse
    
    acceleration2 = PVector.random2D(); // crawling
    if(dist < 300)
    {
      acceleration1 = acceleration2.lerp(acceleration1,1.0-(dist/300.0));
      acceleration1.mult(-1.0);
      velocity.add(acceleration1);
    }
    else
    {
      velocity.add(acceleration2);
    }
    
    velocity.limit(max_speed);
    location.add(velocity);
    }
  }
  
  void bite(int x, int y)
  {
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
    float dist = dir.mag();
    if(dist < 30) this.live = false;
  }
  
  void check()
  
 {
  if(live)
   {
    if(location.x < 0) location.x = width;
    if(location.x > width) location.x = 0;
    if(location.y < 0) location.y = height;
    if(location.y > height) location.y = 0;
   }
 }
 
  void display() 
  {
    if(live)
    {
    fill(30,150,255);
    circle(location.x,location.y,16);
    }
  }
}
