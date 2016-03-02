public class Platform
{
  private float platX, platY, platWidth;
  private float platThickness = 20;
  
  private float platOriginalY;
  
  private float platXVel, platYVel;
  private float platXSpeed = 1;
  private float platXSprintSpeed = 2;//For sprinting (if double-tap and hold A or D)
  private float platYJumpSpeed = 2;
  Platform(){}
  Platform(float x, float y, float w)
  {
    platOriginalY = y;
    platX = x;
    platY = y;
    platWidth = w;
  }
  
  private float getXCoord()
  {
    return platX;
  }
  
  private void setXCoord(float newX)
  {
    platX = newX;
  }
  
  private float getYCoord()
  {
    return platY;
  }
  
  private void setYCoord(float newY)
  {
    platY = newY;
  }
  private float getWidth()
  {
    return platWidth;
  }
  
  private float getThickness()
  {
    return platThickness;
  }
  
  private float getPlatXSpeed()
  {
    return platXSpeed;
  }
  
  private float getPlatXSprintSpeed()
  {
    return platXSprintSpeed;
  }
  
  private float getPlatXVel()
  {
    return platXVel;
  }
  
  private void setPlatXVel(float newVel)
  {
    platXVel = newVel;
  }
  
  private float getPlatYSpeed()
  {
    return platYJumpSpeed;
  }
  
  private float getPlatYVel()
  {
    return platYVel;
  }
  
  private void setPlatYVel(float newVel)
  {
    platYVel = newVel;
  }
  
  private float getOriginalY()
  {
    return platOriginalY;
  }
}