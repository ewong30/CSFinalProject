public class Screen {
  float x, y;
  boolean winscreen;
  boolean deadScreen;
  int exWidth = 8;

  public Screen(float x, float y) {
    this.x = x;
    this.y = y;
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
    fill(255, 255, 255);
    textSize(50);
    text("That's all for now!\nMore levels to come.", x, y - 40);

    rectMode(RADIUS);
    fill(135);
    stroke(0);
    strokeWeight(2);
    rect(x, y + 140, 120, 28);

    textSize(35);
    fill(#FFD900);
    text("PLAY AGAIN", x, y + 152);
  }
}
