public class Screen {
  float x, y;
  boolean winscreen;
  boolean deadScreen;
  int exWidth = 8;
  boolean completed = false;

  public Screen(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void mainMenu(Fireboy fire, Watergirl water) {
    fire.mainM = true;
    water.mainM = true;

    fill(113, 103, 51);
    rect(0, 0, width, height);
    textSize(55);
    fill(#FFD900);
    noStroke();
    textAlign(CENTER);
    text("Level Select", width / 2, y - 250);
    rectMode(CORNERS);
    if (!completed)
      fill(78, 60, 14);
    else {
      fill(#FFD900);
    }

    rect(380, 305, 535, 385);
    triangle(380, 305, 535, 305, 457.5, 255);
    triangle(380, 385, 535, 385, 457.5, 435);
    if(!completed)
    fill(82, 82, 82);
    else {
      fill(255,123,36);
    }
    rect(410, 325, 505, 365);
    triangle(410, 325, 505, 325, 457.5, 285);
    triangle(410, 365, 505, 365, 457.5, 405);
}

void display() {
  stroke(2);
  rectMode(RADIUS);
  fill(0, 170);
  rect(x, y, width, height);

  //dark gray border
  fill(90);
  rect(x, y, 399, 239, 20, 20, 20, 20);

  //center light gray
  fill(150, 150, 150);
  rect(x, y, 370, 210, 5, 5, 5, 5);

  //yellow corners
  fill(#FFD900);
  rectMode(CORNERS);
  rect(x - (370 - exWidth), y - (210 - exWidth), x - (397 + exWidth), y - (237 + exWidth), 200, 3, 8, 3);
  rect(x + (370 - exWidth), y - (210 - exWidth), x + (397 + exWidth), y - (237 + exWidth), 3, 200, 3, 8);
  rect(x + (370 - exWidth), y + (210 - exWidth), x + (397 + exWidth), y + (237 + exWidth), 8, 3, 200, 3);
  rect(x - (370 - exWidth), y + (210 - exWidth), x - (397 + exWidth), y + (237 + exWidth), 3, 8, 3, 200);
  noStroke();
}

void displayWin() {
  winscreen = true;
  display();

  textAlign(CENTER);
  textSize(55);
  stroke(0);
  text("LEVEL COMPLETE!", x, y - 60);

  rectMode(RADIUS);
  fill(135);
  stroke(0);
  strokeWeight(2);
  rect(x, y + 120, 120, 28);

  textSize(35);
  fill(#FFD900);
  text("CONTINUE", x, y + 132);
  /*
    fill(150, 150, 150);
   rectMode(CORNER);
   rect(x, y, 800, 600);
   fill(218, 185, 41);
   rect(x - 30, y - 30, 60, 60);
   rect(x - 30, y + 570, 60, 60);
   rect(x + 770, y - 30, 60, 60);
   rect(x + 770, y + 570, 60, 60);
   textSize(72);
   stroke(0);
   strokeWeight(3);
   text("You Win!", 295, 225);
   text("Continue?", 275, 550);
   noFill();
   stroke(0);
   strokeWeight(2);
   rect (200, 475, 500, 100);
   noStroke();
   strokeWeight(0);
   */
}

void displayDead() {
  deadScreen = true;

  display();
  textAlign(CENTER);
  textSize(60);
  stroke(0);
  //strokeWeight(3);
  text("GAME OVER!", x, y - 60);

  textSize(27);
  text("RETRY OR RETURN TO MAIN MENU", x, y);

  fill(135);
  stroke(0);
  strokeWeight(2);

  rectMode(RADIUS);
  rect(x - 130, y + 100, 90, 28);
  rect(x + 130, y + 100, 90, 28);

  fill(#FFD900);
  textSize(35);
  text("RETRY", x - 130, y + 112);
  text("MENU", x + 130, y + 112);

  noStroke();
  strokeWeight(0);
}

void WIP() { 


  fill(0);
  rect(0, 0, width, height);
  display();
  fill(255, 255, 255);
  textSize(50);
  textAlign(CENTER);
  text("Game Cleared!", x, y - 40);

  rectMode(RADIUS);
  
  fill(135);
  stroke(0);
  strokeWeight(2);

  rectMode(RADIUS);
  rect(x - 130, y + 100, 130, 28);
  rect(x + 130, y + 100, 90, 28);

  fill(#FFD900);
  textSize(35);
  text("PLAY AGAIN", x - 130, y + 112);
  text("MENU", x + 130, y + 112);
}
}
