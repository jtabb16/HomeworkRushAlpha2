public class BoundaryDetection
{
  BoundaryDetection()
  {
    
  }
  
  private boolean checkIfPlayerIsOnPlatform(Player p, HashMap <Integer, Platform> platforms)
  {
    for (int x = 0; x < platforms.size(); x++)
    {
       if ( (p.getPlayerY() - p.getPlayerHeight()/2) >= (platforms.get(x).getYCoord() - platforms.get(x).getThickness()/2)//If player's head is on or below top of platform
       &&   (p.getPlayerY() - p.getPlayerHeight()/2) <= (platforms.get(x).getYCoord() + platforms.get(x).getThickness()/2)//If player's head is on or above bottom of platform
       &&   (platforms.get(x).getXCoord() + platforms.get(x).getWidth()/2) >= (p.getPlayerX() - p.getPlayerWidth()/2)//if the player's left side is on a platform
       &&   (platforms.get(x).getXCoord() - platforms.get(x).getWidth()/2) <= (p.getPlayerX() + p.getPlayerWidth()/2)//if the player's right side is on a platform
       &&   (platforms.get(x).getPlatYVel() > 0)//the player is going up
          )
      {
        println ("HIT Bottom of Platform " + x);
        platforms.get(x).setYCoord(p.getPlayerY() - p.getPlayerHeight()/2 - platforms.get(x).getThickness()/2);
        //if it hits one, we need to stop all of them
        for (int y = 0; y < platforms.size(); y++)
        {
          //platforms.get(y).setPlatYVel(0);
          platforms.get(y).setYCoord( platforms.get(x).getYCoord() - (platforms.get(x).getOriginalY() - platforms.get(y).getOriginalY()) );//Set all the other platforms' y's to the current platform's y + their delta
        }
      }
      
       else if ( (platforms.get(x).getXCoord() + platforms.get(x).getWidth()/2) >= (p.getPlayerX() - p.getPlayerWidth()/2)//if the player's left side is on a platform
       &&   (platforms.get(x).getXCoord() - platforms.get(x).getWidth()/2) <= (p.getPlayerX() + p.getPlayerWidth()/2)//if the player's right side is on a platform
       &&   (platforms.get(x).getYCoord() - platforms.get(x).getThickness()/2) <= (p.getPlayerY() + p.getPlayerHeight()/2)//if the player's feet are on or below the top of the platform
       &&   (platforms.get(x).getYCoord()) >= (p.getPlayerY() + p.getPlayerHeight()/2)//if the player's feet are on or above the middle of the platform
       &&   (platforms.get(x).getPlatYVel() < 0)//Only if the player is falling. No "popping onto platform" from below
          )
      {
        println ("HIT Top of Platform " + x);
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
    return false;//Only reaches here if no platform in the for loop triggered this method to return true
  }//End checkIfPlayerIsOnPlatform
  
  /*
  private void checkIfBullyIsOnPlatform(Player p, HashMap <Integer, Platform> platforms)
  {
    
  }
  
  private void checkIfPlayerIsOnBully(Player p, HashMap <Integer, Platform> platforms)
  {
    
  }
  */
}