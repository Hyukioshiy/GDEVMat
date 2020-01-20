class Walker
{
  float xPosition,yPosition;
  
  Walker()
  {
    
  };
  
  Walker(float x, float y)
  {
    xPosition = x;
    yPosition = y;
  }
  
  void render()
  {
    circle(xPosition,yPosition,30);
  }
  
  void RandomWalk()
  {
    int direction = floor(random(7));
    
    int randomR = floor(random(0,256));
    int randomG = floor(random(0,256));
    int randomB = floor(random(0,256));
    
    color c = color(randomR,randomG,randomB,155);
    fill(c);
    noStroke();
    switch(direction)
    {
      case 0:
        yPosition+=10;
        break;
        
      case 1:
         yPosition-=10;
         break;
         
      case 2:
         xPosition+=10;
         break;
         
       case 3:
         xPosition-=10;
         break;
       
       case 4:
         yPosition+=10;
         xPosition+=10;
         break;
         
      case 5:
         yPosition-=10;
         xPosition+=10;
         break;
         
       case 6:
         yPosition+=10;
         xPosition-=10;
         break;
       
       case 7:
         yPosition-=10;
         xPosition-=10;
        
    }
    
    
    
    
  }
}
