public class KeyboardControl
{ 
  private HashMap <Integer, boolean[]> keys;
  
  KeyboardControl(int numKeys)//At least need 4 keys: WASD
  {
    keys = new HashMap <Integer, boolean[]> ();
    genKeyArray(numKeys);
  }
  
  private void genKeyArray(int numKeys)
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
  
  private void keyIsPressed(char keyValue)
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
  
  private void changePressedKey(int mapIndex)
  {
    boolean [] array = keys.get(mapIndex);
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
  
  private void keyIsReleased(char keyValue)
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
  
  private void changeReleasedKey(int mapIndex)
  {
    boolean [] array = keys.get(mapIndex);
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
  
  private HashMap <Integer, boolean[]> getKeys()
  {
    return keys;
  }
}//End class