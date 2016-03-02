
boolean runGame = true;
boolean viewMenu = false;
Environment env;
KeyboardControl kc;
void setup()
{
  size (1200, 700);
  frameRate(250);
  
  env = new Environment();
  //Make an environment
        //Make a player
        //Make a controller
        //Make a map out of platforms
  kc = new KeyboardControl(4);
}

void draw()
{
  surface.setTitle("HomeworkRushAlpha2  --  Running at: " + str(frameRate) + " FPS");
  
  //Draw Background / Erase Stuff//////////////////////////
  rectMode (CORNER);
  fill(0);
  stroke(0);
  rect (0,0,width,height);
  ////////////////////////////////////////////////////////
  
  
  
  if (runGame)
  {
    
    env.updateEnvironment();
    
    //Continually update the environment
      //Check the boundaries of the player and platform
    
  }
  else if (viewMenu)
  {
    
  }
  else
  {
    noLoop();
    //Pause game
  }
  
}

void keyReleased()
{
  kc.keyIsReleased(key);
}