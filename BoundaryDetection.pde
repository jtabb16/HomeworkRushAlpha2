public class BoundaryDetection
{
  BoundaryDetection()
  {
    
  }
  
  public boolean checkIfPlayerIsOnPlatform(Player p, HashMap <Integer, Platform> platforms)
  {
    //boolean returnVal = false;
    for (int x = 0; x < platforms.size(); x++)
    {
       if ( (platforms.get(x).getXCoord() + platforms.get(x).getWidth()/2) >= (p.getPlayerX() - p.getPlayerWidth()/2)//if the player's left side is on a platform
       &&   (platforms.get(x).getXCoord() - platforms.get(x).getWidth()/2) <= (p.getPlayerX() + p.getPlayerWidth()/2)//if the player's right side is on a platform
       &&   (platforms.get(x).getYCoord() - platforms.get(x).getThickness()/2) <= (p.getPlayerY() + p.getPlayerHeight()/2)//if the player's feet are on or below the top of the platform
       &&   (platforms.get(x).getYCoord() + platforms.get(x).getThickness()/2) >= (p.getPlayerY() + p.getPlayerHeight()/2)//if the player's feet are on or above the bottom of the platform
       &&   (platforms.get(x).getPlatYVel() < 0) )//Only if the player is falling. No "popping onto platform" from below
       //Should I let the player jump through the bottom of platforms?
      {
        //returnVal = true;
        println ("HIT Platform " + x);
        platforms.get(x).setYCoord(p.getPlayerY() + p.getPlayerHeight()/2 + platforms.get(x).getThickness()/2);
        //if it hits one, we need to stop all of them
        for (int y = 0; y < platforms.size(); y++)
        {
          platforms.get(y).setPlatYVel(0);
          platforms.get(y).setYCoord( platforms.get(x).getYCoord() - (platforms.get(x).getOriginalY() - platforms.get(y).getOriginalY()) );//Set all the other platforms' y's to the current platform's y + their delta
        }
        return true;
      }
      else
      {
       
      }
    }//End for
    return false;
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