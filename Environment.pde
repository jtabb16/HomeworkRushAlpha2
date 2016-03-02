public class Environment
{
  //int jumpCounter = 0;
  float gravity = -.02;
  Player player;
  GameMap gameMap;
  BoundaryDetection bD;
  
  Environment()
  {  
    gameMap = new GameMap(0);//Make a map out of platforms
    player = new Player(gameMap.getPlayerStartX(), gameMap.getPlayerStartY());//Make a player
    bD = new BoundaryDetection();//Add a boundary listener / detector
  }
  
  public void updateEnvironment()
  {
    if (keyPressed)
      kc.keyIsPressed(key);
    kc.performKeys(bD.checkIfPlayerIsOnPlatform (player, gameMap.getPlatforms()), gameMap.getPlatforms());
    
    //Update the position of the player and platforms
    for (int x = 0; x < gameMap.getPlatforms().size(); x++)
    {
      gameMap.getPlatforms().get(x).setPlatYVel(gameMap.getPlatforms().get(x).getPlatYVel() + gravity);
      gameMap.getPlatforms().get(x).setYCoord(gameMap.getPlatforms().get(x).getYCoord() + gameMap.getPlatforms().get(x).getPlatYVel());
    }
    
    //Draw the player and gameMap(platforms) after processing all of the coordinates
    player.drawPlayer();
    gameMap.drawGameMap();
  }
}