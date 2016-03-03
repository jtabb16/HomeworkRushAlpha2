public class Environment
{
  private float gravity = -.02;
  private float maxScreenShiftAmount = 80;
  private boolean shiftPlayer = true;
  
  private Player player;
  private GameMap gameMap;
  private BoundaryDetection bD;
  private InputProcessor iP;
  
  Environment()
  {  
    gameMap = new GameMap(0);//Make a map out of platforms
    player = new Player(gameMap.getPlayerStartX(), gameMap.getPlayerStartY());//Make a player
    bD = new BoundaryDetection();//Add a boundary listener / detector
    iP = new InputProcessor();
  }
  
  private void updateEnvironment()
  {
    if (keyPressed)
      kc.keyIsPressed(key);
    iP.performKeys(player, bD.checkIfPlayerIsOnPlatform (player, gameMap.getPlatforms()), gameMap.getPlatforms(), kc.getKeys());
    
    //Update the position of the player and platforms
    
    if (iP.getFacingRightBoolean() && player.getPlayerX() >= (width/2 - maxScreenShiftAmount))
      shiftPlayer = true;
    else if (!iP.getFacingRightBoolean() && player.getPlayerX() <= (width/2 - maxScreenShiftAmount))
      shiftPlayer = true;
    //else
      //shiftPlayer = false;
      
    if (shiftPlayer)
    {
      player.setXVel(player.getXVel() * player.getPlayerXAccelMag());
      player.setPlayerX(player.getPlayerX() + player.getXVel());
    }
    
    for (int x = 0; x < gameMap.getPlatforms().size(); x++)
    {
      if (shiftPlayer)
      {
        gameMap.getPlatforms().get(x).setXCoord(gameMap.getPlatforms().get(x).getXCoord() + player.getXVel());
      }
      
      gameMap.getPlatforms().get(x).setPlatYVel(gameMap.getPlatforms().get(x).getPlatYVel() + gravity);
      gameMap.getPlatforms().get(x).setYCoord(gameMap.getPlatforms().get(x).getYCoord() + gameMap.getPlatforms().get(x).getPlatYVel());
      
      //THIS works for vertical, but maybe should make it more based off of its own coordinates with another BoundaryDetection method
      if (gameMap.getBullies().keySet().contains(x))
      {
        for (int y = 0; y < gameMap.getBullies().get(x).length; y++)
        {
          gameMap.getBullies().get(x)[y].setBullyY(gameMap.getPlatforms().get(x).getYCoord() + gameMap.getPlatforms().get(x).getPlatYVel() - gameMap.getPlatforms().get(x).getThickness()/2- gameMap.getBullies().get(x)[y].getHeight()/2);
        }
      }
      
      
    }
    
    //Draw the player and gameMap(platforms) after processing all of the coordinates
    player.drawPlayer();
    gameMap.drawGameMap();
    gameMap.drawBullies();
  }
}