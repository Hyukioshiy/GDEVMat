float radius = 50;

float x,y, prevX, prevY , angle;
int waveCount = 5;


int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave


float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup()
{
  size(1920,1080,P3D);
  camera(0,0, - (height / 2) / tan(PI * 30 / 180) , 0,0,0,0, -1 ,0);
  
  
    
  w = width + 16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw()
{
  background(155);
  drawPlane();
  noStroke(); 
  drawLinearFunction();
  drawQuadraticFunction();
  drawCircle();
  
 
 
  calcWave();
  renderWave();

  
  
  
  
}

void drawPlane()
{
  color c = color(0,0,0);
  
  fill(c);
  stroke(c);
  strokeWeight(1);
  
  fill(0, 0, 0, 255);
  line(300,0,-300,0);
  line(0,300,0,-300);
  

  for(int i = -300 ; i <= 300 ; i += 10)  
  {
    
    line(i,-5,i,5);
    line(-5,i,5,i);
  }
}
void drawLinearFunction()
{
  //background(255);  
 

  /*
    f(x) = x + 2;
    Let x b = 4, then y = 6 (4,6);
    Let x be -5, then y = -3 (-5,-3)
   */
   fill(255, 0, 0, 255);
   
  for(int x = - 200 ; x <= 200 ; x++)
  {
    
    circle(x, x * 2 - 3 ,1);
  }
}

void drawQuadraticFunction()
{
  
  /*
    f(x) = x ^ 2;
    
   */
   
   for( float x = -300 ; x <= 300; x += 0.1f)
   {
     fill(0,0,255);
     circle(x * 10,(float)Math.pow(x,2),1);
   }
   
}

void drawCircle()
{
  fill(0,255,0);
    
  for(int i = 0 ; i < 360 ; i++)
  {
    circle((float)Math.cos(i) * radius, (float)Math.sin(i) * radius,1);
  }
}

void drawWaves()
{
  /*for(float x = -5; x <= 5 ; x += 0.1f)
  {
    circle(x * 5,(float)Math.pow(x,2) ,5);
  }*/
  
  float a = 0.0;
  float inc = TWO_PI/25.0;
  float prev_x = 0, prev_y = 0, x, y;

  for(int i=0; i<100; i=i+4) {
    x = i;
    y = 50 + sin(a) * 40.0;
    line(prev_x, prev_y, x, y);
    prev_x = x;
    prev_y = y;
    a = a + inc;
  }
}


void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    fill(255);
  
    ellipse(x*xspacing, +yvalues[x], 16, 16);
  }
}
