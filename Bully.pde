public class Bully
{
  private float bullyX, bullyY;
  private float bullyWidth;
  private float bullyHeight;
  Bully(){}
  Bully(float x, float y)
  {
    Player p = new Player();//Make a generic player to get player widhth and height
    bullyX = x;
    bullyY = y;
    bullyWidth = p.getPlayerWidth();
    bullyHeight = p.getPlayerHeight();
  }
  
  /*
  private void drawBully()
  {
    rectMode (CENTER);
    fill (255);
    stroke (255,0,0);
    rect ( bullyX, bullyY, bullyWidth, bullyHeight );
  }
  */
  
  private float getXCoord()
  {
    return bullyX;
  }
  
  private float getYCoord()
  {
    return bullyY;
  }
  
  private float getWidth()
  {
    return bullyWidth;
  }
  
  private float getHeight()
  {
    return bullyHeight;
  }
}