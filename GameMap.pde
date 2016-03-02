public class GameMap
{
  //Was going to use array list b/c don't know the size of the array
  //HashMap has better big O for adding elements after there are many elements
  HashMap <Integer, Platform> plats;
  
  float startX;
  //float startY;
  //float currentX;
  //float currentY;
  GameMap(int levelNum)
  {
    plats = new HashMap <Integer, Platform>();
    generateLevel(levelNum);//Fill the map with platforms
  }
  
  public void generateLevel(int levelNumber)
  {
    //Eventually, read from a file to do this
    if (levelNumber == 0)
    {
      startX = -50;
      Platform genericPlatform = new Platform(0,0,0);
      plats.put( 0, new Platform(width/2, height - genericPlatform.getThickness()/2, width - startX ));
      plats.put( 1, new Platform(startX + 100, height/2, 200) );
      plats.put( 2, new Platform(startX + 300, height/2 - 50, 100) );
    }
  }
  
  public void drawGameMap()
  {
    rectMode (CENTER);
    fill (0,255,0);
    stroke (255);
    for (int x = 0; x < plats.size(); x++)
    {
      rect ( plats.get(x).getXCoord(), plats.get(x).getYCoord(), plats.get(x).getWidth(), plats.get(x).getThickness() );
    }
  }
  
  public HashMap <Integer, Platform> getPlatforms()
  {
        //println(plats.size());

    return plats;
  }
}