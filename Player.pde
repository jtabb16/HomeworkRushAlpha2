public class Player
{
  float playerX, playerY;
  float playerWidth = 20;
  float playerHeight = 50;
  //float playerYVel = 0;
  //float playerYSpeed = 5;
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
  
  /*
  public void setPlayerY(float y)
  {
    playerY = y;
  }
  
  public void setPlayerYVel(float yVel)
  {
    playerYVel = yVel;
  }
  */
  public float getPlayerX()
  {
    return playerX;
  }
  
  public float getPlayerY()
  {
    return playerY;
  }
  
  /*
  public float getPlayerYVel()
  {
    return playerYVel;
  }
  */
  public float getPlayerWidth()
  {
    return playerWidth;
  }
  
  public float getPlayerHeight()
  {
    return playerHeight;
  }
  
  /*
  public float getPlayerYSpeed()
  {
    return playerYSpeed;
  }
  */
}