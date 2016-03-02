public class BoundaryDetection
{
  BoundaryDetection()
  {
    
  }
  
  public void checkIfPlayerIsOnPlatform(Player p, HashMap <Integer, Platform> platforms)
  {
    for (int x = 0; x < platforms.size(); x++)
    {
       if ( (platforms.get(x).getXCoord() + platforms.get(x).getWidth()/2) >= (p.getPlayerX() - p.getPlayerWidth()/2)
       &&   (platforms.get(x).getXCoord() - platforms.get(x).getWidth()/2) <= (p.getPlayerX() + p.getPlayerWidth()/2)
       &&   (platforms.get(x).getYCoord() - platforms.get(x).getThickness()/2) <= (p.getPlayerY() + p.getPlayerHeight()/2)
       &&   (platforms.get(x).getYCoord() + platforms.get(x).getThickness()/2) >= (p.getPlayerY() + p.getPlayerHeight()/2) )//if it hits one, we need to stop all of them
      {
        println ("HIT Platform " + x);
        platforms.get(x).setYCoord(p.getPlayerY() + p.getPlayerHeight()/2 + platforms.get(x).getThickness()/2);
        for (int y = 0; y < platforms.size(); y++)
        {
          platforms.get(y).setPlatYVel(0);
          platforms.get(y).setYCoord( platforms.get(x).getYCoord() - (platforms.get(x).getOriginalY() - platforms.get(y).getOriginalY()) );//Set all the other platforms' y's to the current platform's y + their delta
        }
      }
      else
      {
       
      }
    }//End for
  }//End checkIfPlayerIsOnPlatform
  
  /*
  public void checkIfBullyIsOnPlatform(Player p, HashMap <Integer, Platform> platforms)
  {
    
  }
  
  public void checkIfPlayerIsOnBully(Player p, HashMap <Integer, Platform> platforms)
  {
    
  }
  */
}