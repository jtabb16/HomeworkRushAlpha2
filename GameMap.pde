public class GameMap
{
  //Was going to use array list b/c don't know the size of the array
  //HashMap has better big O for adding elements after there are many elements
  private HashMap <Integer, Platform> plats;//Map of platforms
  private HashMap <Integer, Bully> bullies;//Map of bullies
  
  private float startX;
  private float playerStartX;
  private float playerStartY;
  GameMap(int levelNum)
  {
    plats = new HashMap <Integer, Platform>();
    bullies = new HashMap <Integer, Bully>();
    generateLevel(levelNum);//Fill the map with platforms
  }
  
  private void generateLevel(int levelNumber)
  {
    //Eventually, read from a file to do this
    if (levelNumber == 0)//Make the 0th level (The tutorial)
    {
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
      bullies.put(0, new Bully(startX + 100, startY - 150 ) );//Need to make bullies affected by gravity and stuff, just like the platforms
      plats.put( 2, new Platform(startX + 300, startY - 250, 100) );
    }
  }
  
  private void drawGameMap()
  {
    rectMode (CENTER);
    fill (0,255,0);
    stroke (255);
    for (int x = 0; x < plats.size(); x++)
    {
      rect ( plats.get(x).getXCoord(), plats.get(x).getYCoord(), plats.get(x).getWidth(), plats.get(x).getThickness() );
      //plats.get(x).drawPlatform();
    }
  }
  
  private void drawBullies()
  {
    rectMode (CENTER);
    fill (255,0,0);
    stroke (255);
    for (int x = 0; x < bullies.size(); x++)
    {
      rect ( bullies.get(x).getXCoord(), bullies.get(x).getYCoord(), bullies.get(x).getWidth(), bullies.get(x).getHeight() );
      //plats.get(x).drawBully();
    }
  }
  
  private HashMap <Integer, Platform> getPlatforms()
  {
    return plats;
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