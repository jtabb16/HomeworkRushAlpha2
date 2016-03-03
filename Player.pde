public class Player
{
  float playerX, playerY;
  float playerWidth = 20;
  float playerHeight = 50;
  float playerXSpeed = 2;
  float playerXVel;
  float playerXAccelMag = .99;
  //The player moving up and down / side to side is actually movement of the platforms
  Player(){}
  Player(float initialPx, float initialPy)
  {
    playerX = initialPx;
    playerY = initialPy;
  }
  
  public void drawPlayer()
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
  public float getPlayerX()
  {
    return playerX;
  }
  
  public float getPlayerY()
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
  public float getPlayerWidth()
  {
    return playerWidth;
  }
  public float getPlayerHeight()
  {
    return playerHeight;
  }
  private float getPlayerXAccelMag()
  {
    return playerXAccelMag;
  }
}