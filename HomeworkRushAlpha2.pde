/*
  Author: Jack Tabb
  Date: 03/02/2016
  Title: HomeworkRushAlpha2
  Purpose: A really early version of HomeworkRush, a platformer/RPG with a school theme
  
  To Do:
    1. Try to make each class less than 100 lines of code
    2. Completely design one map
    3. Add Bullies and their AI
    4. Add Attack and Health
    5. Add Scoring by Time
    5. Add Images
    6. Add ability to load map from text file
    7. Add player perks and a player configuration file that saves settings, player progress, etc.
    8. Add GUI Main Menu, with options and stuff that get saved
*/
private boolean runGame = true;
private boolean viewMenu = false;
private Environment env;
private KeyboardControl kc;
void setup()
{
  //fullScreen();
  size (1200, 700);
  frameRate(250);
  
  env = new Environment();//Make an environment
  kc = new KeyboardControl(4);//Make a controller / keyboard listener
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