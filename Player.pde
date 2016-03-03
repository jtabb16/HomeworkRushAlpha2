public class Player
{
  private float playerX, playerY;
  private float playerWidth = 20;
  private float playerHeight = 50;
  private float playerXSpeed = 2;
  private float playerXVel;
  private float playerXAccelMag = .99;
  //The player moving up and down / side to side is actually movement of the platforms
  Player(){}
  Player(float initialPx, float initialPy)
  {
    playerX = initialPx;
    playerY = initialPy;
  }
  
  private void drawPlayer()
  {
    rectMode (CENTER);
    fill (255);
    stroke (0,255,0);
    rect ( playerX, playerY, playerWidth, playerHeight );
  }
  
  private void setPlayerX(float x)
  {
    playerX = x;
  }
  private void setPlayerY(float y)
  {
    playerY = y;
  }
  private float getPlayerX()
  {
    return playerX;
  }
  
  private float getPlayerY()
  {
    return playerY;
  }
  
  private float getPlayerXSpeed()
  {
    return playerXSpeed;
  }
  
  private void setXVel(float vel)
  {
    playerXVel = vel;
  }
  
  private float getXVel()
  {
    return playerXVel;
  }
  private float getPlayerWidth()
  {
    return playerWidth;
  }
  private float getPlayerHeight()
  {
    return playerHeight;
  }
  private float getPlayerXAccelMag()
  {
    return playerXAccelMag;
  }
}