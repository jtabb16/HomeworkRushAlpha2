public class InputProcessor
{
  private int jumpCount = 0;//For double jumps, etc.
  private int aTapCount = 0;//For enabling sprint on double tap
  private int dTapCount = 0;
  private int doubleTapDelayInMillis = 225;
  private float aTapStartTime;
  private float dTapStartTime;
  
  private boolean faceRight = false;
  
  InputProcessor(){}
  
  private void performKeys(Player p, boolean isOnPlatform, HashMap <Integer, Platform> platforms, HashMap <Integer, boolean[]> keys)
  {
    //'W'///////////////////////////////////////////////////////////////////////////////////////////////
    if (isOnPlatform)
      jumpCount = 0;
    if ( keys.get(0)[0] && !keys.get(0)[1])//If 'w' is pressed and 'w' is not being held down
    {
      println ("W");
      //Double jump is allowed by default
      //Triple jump is allowed by special items. to defeat boss, triple jump is necessary. Have to get triple jump from opening treasure-locker on special levels
      if (jumpCount < 2)
      {
        for (int x = 0; x < platforms.size(); x++)
        {
          platforms.get(x).setPlatYVel(platforms.get(x).getPlatYSpeed());
        }
        jumpCount++;
      }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //'S'///////////////////////////////////////////////////////////////////////////////////////////////
    else if (keys.get(2)[0] || keys.get(2)[1])//If 'S' is pressed or is being held down
    {
      println ("S");
      for (int x = 0; x < platforms.size(); x++)
      {
        platforms.get(x).setPlatYVel(-1*platforms.get(x).getPlatYSpeed());
      }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //'A'///////////////////////////////////////////////////////////////////////////////////////////////
    if (keys.get(1)[0] && !keys.get(1)[1])//If 'A' is pressed
    {
      if (faceRight)
      {
        p.setXVel(p.getPlayerXSpeed());
        faceRight = false;
      }
      aTapStartTime = millis();
      aTapCount++;
    }
    if(keys.get(1)[1])//If 'A' is pressed or is being held down
    {
      println ("A");
      if (aTapCount <= 1)
      {
        for (int x = 0; x < platforms.size(); x++)
        {
          platforms.get(x).setPlatXVel(platforms.get(x).getPlatXSpeed());
          platforms.get(x).setXCoord(platforms.get(x).getXCoord() + platforms.get(x).getPlatXVel());
        }
      }
      else if (aTapCount >= 2)
      {
        for (int x = 0; x < platforms.size(); x++)
        {
          platforms.get(x).setPlatXVel(platforms.get(x).getPlatXSprintSpeed());
          platforms.get(x).setXCoord(platforms.get(x).getXCoord() + platforms.get(x).getPlatXVel());
        }
      }
    }
    else
    {
      if ((millis() - aTapStartTime) > doubleTapDelayInMillis)//Gives the player more time for the second tap of the double-tap to register
        aTapCount = 0;
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //'D'///////////////////////////////////////////////////////////////////////////////////////////////
    if (keys.get(3)[0] && !keys.get(3)[1])//If 'D' is pressed
      {
        if (!faceRight)
        {
          p.setXVel(-1*p.getPlayerXSpeed());
          faceRight = true;
        }
        dTapStartTime = millis();
        dTapCount++;
      }
      if(keys.get(3)[1])//If 'D' is pressed or is being held down
      {
        println ("D");
        if (dTapCount <= 1)
        {
          for (int x = 0; x < platforms.size(); x++)
          {
            platforms.get(x).setPlatXVel(-1*platforms.get(x).getPlatXSpeed());
            platforms.get(x).setXCoord(platforms.get(x).getXCoord() + platforms.get(x).getPlatXVel());
          }
        }
        else if (dTapCount >= 2)
        {
          for (int x = 0; x < platforms.size(); x++)
          {
            platforms.get(x).setPlatXVel(-1*platforms.get(x).getPlatXSprintSpeed());
            platforms.get(x).setXCoord(platforms.get(x).getXCoord() + platforms.get(x).getPlatXVel());
          }
        }
      }
      else
      {
        if ((millis() - dTapStartTime) > doubleTapDelayInMillis)//Gives the player more time for the second tap of the double-tap to register
          dTapCount = 0;
      }
      //////////////////////////////////////////////////////////////////////////////////////////////////////
  }//End performKeys
  
  private boolean getFacingRightBoolean()
  {
    return faceRight;
  }
}