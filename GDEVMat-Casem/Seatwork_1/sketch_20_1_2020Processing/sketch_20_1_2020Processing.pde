

void setup()
{
   
  size(1920,1080,P3D);
  camera(0,0, - (height / 2) / tan(PI * 30 / 180) , 0,0,0,0, -1 ,0);
  
  background(255);
}  

Walker walker = new Walker();

void draw()
{
  //background(255);
  walker.render();
  walker.RandomWalk();
  float randomNumber = floor(random(5));
  println(randomNumber);
}
