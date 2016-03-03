public class GameMap
{
  //Was going to use array list b/c don't know the size of the array
  //HashMap has better big O for adding elements after there are many elements
  private HashMap <Integer, Platform> plats;//Map of platforms
  private HashMap <Integer, Bully []> bullies;//Map of bullies//Can have multiple bullies on one platform//key value corresponds with platform #
  
  private float startX;
  private float playerStartX;
  private float playerStartY;
  GameMap(int levelNum)
  {
    plats = new HashMap <Integer, Platform>();
    bullies = new HashMap <Integer, Bully[]>();
    generateLevel(levelNum);//Fill the map with platforms
  }
  
  private void generateLevel(int levelNumber)
  {
    //Eventually, read from a file to do this
    if (levelNumber == 0)//Make the 0th level (The tutorial)
    {
      Bully [] bulliesOnPlatform;
      Player genericPlayer = new Player();//Generic player
      Platform genericPlatform = new Platform();//Generic platform
      Bully bully = new Bully();
      startX = -50;
      float startY = height - genericPlatform.getThickness() - 100;
      playerStartX = width/2;//Until I control the amount of the screen shown, playerStartX should always be width/2
      playerStartY = startY - genericPlayer.getPlayerHeight()/2 - genericPlatform.getThickness();
      plats.put( 0, new Platform(width/2, startY, 5*width));//Make a floor
      //Don't make the other platforms dependant on screen size
      plats.put( 1, new Platform(startX + 100, startY - 150, 200) );
      bulliesOnPlatform = new Bully[1];
      bulliesOnPlatform[0] = new Bully(startX + 100, startY - 150 - bully.getHeight());
      bullies.put(1, bulliesOnPlatform );//Need to make bullies affected by gravity and stuff, just like the platforms
      
      bulliesOnPlatform = new Bully[2];
      bulliesOnPlatform[0] = new Bully(startX + 150, startY - 150 );
      bulliesOnPlatform[1] = new Bully(startX + 200, startY - 150 );
      bullies.put(2, bulliesOnPlatform);
      
      plats.put( 2, new Platform(startX + 300, startY - 250, 100) );
    }
  }
  
  private void drawGameMap()
  {
    for (int x = 0; x < plats.size(); x++)
    {
      plats.get(x).drawPlatform();
    }
  }
  
  private void drawBullies()
  {
    for (Integer name: bullies.keySet())
    { 
      for (int y = 0; y < bullies.get(name).length; y++)
      {
        bullies.get(name)[y].drawBully();
      }
    }
  }
  
  private HashMap <Integer, Platform> getPlatforms()
  {
    return plats;
  }
  
  private HashMap <Integer, Bully[]> getBullies()
  {
    return bullies;
  }
  
  
  private float getPlayerStartX()
  {
    return playerStartX;
  }
  
  private float getPlayerStartY()
  {
    return playerStartY;
  }
}