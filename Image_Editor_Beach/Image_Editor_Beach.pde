ImageEditor sourceIE;
ImageEditor destinationIE;
void setup()
{
  size(100,100);
  sourceIE = new ImageEditor("beach.jpg");
  destinationIE = new ImageEditor("beach.jpg");
  sourceIE.resizeWindowToImage(2,1);
  noLoop();
}

void draw()
{
  sourceIE.startEditing();
  destinationIE.startEditing();
  for (int y = 1; y < sourceIE.height()-1; y = y + 1)
  {
    for(int x = 1; x < sourceIE.width()-1; x = x + 1)
    {
      
      int r = sourceIE.getRedAt(x,y);
      int g = sourceIE.getGreenAt(x,y);
      int b = sourceIE.getBlueAt(x,y);
      
      //invert colors
      sourceIE.setRedAt(r,x,y);
      sourceIE.setGreenAt(r,x,y);
      sourceIE.setBlueAt(g,x,y);
      
      //blurs red
      int r0 = sourceIE.getRedAt(x,y);
      int r1 = sourceIE.getRedAt(x+1,y);
      int r2 = sourceIE.getRedAt(x-1,y);
      int r3 = sourceIE.getRedAt(x+1,y+1);
      int r4 = sourceIE.getRedAt(x-1,y-1);
      int r5 = sourceIE.getRedAt(x-1,y+1);
      int r6 = sourceIE.getRedAt(x+1,y-1);
      int r7 = sourceIE.getRedAt(x,y+1);
      int r8 = sourceIE.getRedAt(x,y-1);
      
      int average_red = (r0+r1+r2+r3+r4+r5+r6+r7+r8)/9;
      destinationIE.setRedAt(average_red,x,y);
      
      //blurs green
      int g0 = sourceIE.getGreenAt(x,y);
      int g1 = sourceIE.getGreenAt(x+1,y);
      int g2 = sourceIE.getGreenAt(x-1,y);
      int g3 = sourceIE.getGreenAt(x+1,y+1);
      int g4 = sourceIE.getGreenAt(x-1,y-1);
      int g5 = sourceIE.getGreenAt(x-1,y+1);
      int g6 = sourceIE.getGreenAt(x+1,y-1);
      int g7 = sourceIE.getGreenAt(x,y+1);
      int g8 = sourceIE.getGreenAt(x,y-1);
      
      int average_green = (g0+g1+g2+g3+g4+g5+g6+g7+g8)/9;
      destinationIE.setGreenAt(average_green,x,y);
      
      //blurs blue 
      int b0 = sourceIE.getBlueAt(x,y);
      int b1 = sourceIE.getBlueAt(x+1,y);
      int b2 = sourceIE.getBlueAt(x-1,y);
      int b3 = sourceIE.getBlueAt(x+1,y+1);
      int b4 = sourceIE.getBlueAt(x-1,y-1);
      int b5 = sourceIE.getBlueAt(x-1,y+1);
      int b6 = sourceIE.getBlueAt(x+1,y-1);
      int b7 = sourceIE.getBlueAt(x,y+1);
      int b8 = sourceIE.getBlueAt(x,y-1);
      
      int average_blue = (b0+b1+b2+b3+b4+b5+b6+b7+b8)/9;
      destinationIE.setBlueAt(average_blue,x,y);
    }
  }
  
  sourceIE.stopEditing();
  destinationIE.stopEditing();
  sourceIE.drawAt(0,0);
  destinationIE.drawAt(sourceIE.width(),0);
  save("resultInWindow.png");

}
