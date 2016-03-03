public class Bully
{
  float bullyX, bullyY;
  float bullyWidth;
  float bullyHeight;
  Bully(){}
  Bully(float x, float y)
  {
    Player p = new Player();//Make a generic player to get player widhth and height
    bullyX = x;
    bullyY = y;
    bullyWidth = p.getPlayerWidth();
    bullyHeight = p.getPlayerHeight();
  }
  
  
}