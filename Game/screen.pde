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
    deadScreen = true;
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
  }

  void displayDead() {
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

  void nextStage() { 
    fill(0);
    rect(0, 0, width, height);
    fill(255, 255, 255);
    textSize(72);
    text("That's all for now!\nMore levels to come.", (width /2 - 400), 100);
  }
}
