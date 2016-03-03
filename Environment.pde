public class Environment
{
  private float gravity = -.02;
  private float maxScreenShiftAmount = 115;
  private boolean shiftPlayer = true;
  
  private Player player;
  private GameMap gameMap;
  private BoundaryDetection bD;
  
  Environment()
  {  
    gameMap = new GameMap(0);//Make a map out of platforms
    player = new Player(gameMap.getPlayerStartX(), gameMap.getPlayerStartY());//Make a player
    bD = new BoundaryDetection();//Add a boundary listener / detector
  }
  
  private void updateEnvironment()
  {
    if (keyPressed)
      kc.keyIsPressed(key);
    kc.performKeys(player, bD.checkIfPlayerIsOnPlatform (player, gameMap.getPlatforms()), gameMap.getPlatforms());
    
    //Update the position of the player and platforms
    
    if (kc.getFacingRightBoolean() && player.getPlayerX() >= (width/2 - maxScreenShiftAmount))
      shiftPlayer = true;
    else if (!kc.getFacingRightBoolean() && player.getPlayerX() <= (width/2 - maxScreenShiftAmount))
      shiftPlayer = true;
      
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
    }
    
    //Draw the player and gameMap(platforms) after processing all of the coordinates
    player.drawPlayer();
    gameMap.drawGameMap();
    gameMap.drawBullies();
  }
}