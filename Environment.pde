public class Environment
{
  float gravity = -.03;
  Player player;
  GameMap gameMap;
  BoundaryDetection bD;
  
  Environment()
  {
    gameMap = new GameMap(0);
    player = new Player(width/2, height/2);
    bD = new BoundaryDetection();
  }
  
  public void updateEnvironment()
  {
    
    
    //player.setPlayerYVel(player.getPlayerYVel() + gravity);
    //player.setPlayerY(player.getPlayerY() + player.getPlayerYVel());
    
    if (keyPressed)
      kc.keyIsPressed(key);
    kc.performKeys(gameMap.getPlatforms());
    
    //Update the position of the player and platforms according to input
    
    for (int x = 0; x < gameMap.getPlatforms().size(); x++)
    {
      gameMap.getPlatforms().get(x).setPlatYVel(gameMap.getPlatforms().get(x).getPlatYVel() + gravity);
      gameMap.getPlatforms().get(x).setYCoord(gameMap.getPlatforms().get(x).getYCoord() + gameMap.getPlatforms().get(x).getPlatYVel());
      println(gameMap.getPlatforms().get(x).getYCoord());
    }
    
    bD.checkIfPlayerIsOnPlatform (player, gameMap.getPlatforms());
    
    


    player.drawPlayer();
    gameMap.drawGameMap();
  }
}