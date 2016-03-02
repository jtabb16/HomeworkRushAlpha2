public class KeyboardControl
{
  int jumpCount = 0;
  HashMap <Integer, boolean[]> keys;
  public KeyboardControl(int numKeys)//At least need 4 keys: WASD
  {
    keys = new HashMap <Integer, boolean[]> ();
    genKeyArray(numKeys);
  }
  
  protected void genKeyArray(int numKeys)
  {
    for (int x = 0; x < numKeys; x++)
    {
      //Each key has 3 booleans:
      boolean keyIsPressed = false;//Key is pressed/released,
      boolean keyIsHeldDown = false;//Key is being held down, 
      boolean keyIsLongReleased = false;//Key is released for more than one iteration
      boolean [] oneKeyArray = new boolean [3];
      oneKeyArray[0] = keyIsPressed;
      oneKeyArray[1] = keyIsHeldDown;
      oneKeyArray[2] = keyIsLongReleased;
      keys.put(x, oneKeyArray);//Now in the main keys map, there is are ordered arrays of booleans
    }
  }
  
  protected void keyIsPressed(char keyValue)
  {
    switch (keyValue)
    {
      case 'w'://'w' has been pressed
      case 'W'://'W' has been pressed
          changePressedKey(0);
        break;
      case 'a':
      case 'A':
          changePressedKey(1);
        break;
      case 's':
      case 'S':
          changePressedKey(2);
        break;
      case 'd':
      case 'D':
          changePressedKey(3);
        break;
    }
  }
  
  protected void changePressedKey(int mapIndex)
  {
    boolean [] array = this.keys.get(mapIndex);
    //If the key's "keyIsPressed" boolean is false, then it must have just been pressed
    if (!array[0])
      array[1] = false;//the key was just pressed, so it hasn't been held down
    else// the key is being pressed and held
      array[1] = true;
    array[0] = true;//the key has been pressed
    array[2] = false;//the key isn't released anymore
    //Now, put the modified key booleans back into the map
    keys.put(mapIndex,array);
  }
  
  protected void keyIsReleased(char keyValue)
  {
    //Need to think about how to allow a user to press and hold 'd', then press 'w', and still allow the program to know the user is still pressing 'd'
    switch (keyValue)
    {
      case 'w'://'w' has been pressed
      case 'W'://'W' has been pressed
          changeReleasedKey(0);
        break;
      case 'a':
      case 'A':
          changeReleasedKey(1);
        break;
      case 's':
      case 'S':
          changeReleasedKey(2);
        break;
      case 'd':
      case 'D':
          changeReleasedKey(3);
        break;
    }
  }
  
  protected void changeReleasedKey(int mapIndex)
  {
    boolean [] array = this.keys.get(mapIndex);
    //If the key's "keyIsPressed" boolean is true, then it must have just been released
    if (array[0])
      array[2] = false;//the key was just released, so it hasn't been released for more than one iteration
    else// the key has been released for more than one iteration
      array[2] = true;
    array[0] = false;//the key has been released
    array[1] = false;//the key isn't held down anymore
    //Now, put the modified key booleans back into the map
    keys.put(mapIndex,array);
  }
  
  protected void performKeys(boolean isOnPlatform, HashMap <Integer, Platform> platforms)
  {
    if (isOnPlatform)
      jumpCount = 0;
    if ( this.keys.get(0)[0] && !this.keys.get(0)[1])//If 'w' is pressed and 'w' is not being held down
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
    else if (this.keys.get(2)[0] || this.keys.get(2)[1])//If 'S' is pressed or is being held down
    {
      println ("S");
      for (int x = 0; x < platforms.size(); x++)
      {
        platforms.get(x).setPlatYVel(-1*platforms.get(x).getPlatYSpeed());
      }
    }
    else
    {
      
    }
    
    if (this.keys.get(1)[0] || this.keys.get(1)[1])//If 'A' is pressed or is being held down
    {
      println ("A");
      for (int x = 0; x < platforms.size(); x++)
      {
        platforms.get(x).setPlatXVel(platforms.get(x).getPlatXSpeed());
        platforms.get(x).setXCoord(platforms.get(x).getXCoord() + platforms.get(x).getPlatXVel());
      }
    }
    else if (this.keys.get(3)[0] || this.keys.get(3)[1])//If 'D' is pressed or is being held down
    {
      println ("D");
      for (int x = 0; x < platforms.size(); x++)
      {
        platforms.get(x).setPlatXVel(-1*platforms.get(x).getPlatXSpeed());
        platforms.get(x).setXCoord(platforms.get(x).getXCoord() + platforms.get(x).getPlatXVel());
      }
    }
    else
    {
      
    }
  }//End performKeys
}//End class