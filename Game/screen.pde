public class winScreen {
  float x, y;
  boolean winscreen;
  boolean deadScreen;

  public winScreen(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void displayWin() {
    winscreen = true;
    fill(150,150,150);
    rectMode(CORNER);
    rect(x, y, 800,600);
    fill(218,185,41);
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
    deadScreen = true;
    fill(150,150,150);
    rectMode(CORNER);
    rect(x, y, 800,600);
    fill(218,185,41);
    rect(x - 30, y - 30, 60, 60);
    rect(x - 30, y + 570, 60, 60);
    rect(x + 770, y - 30, 60, 60);
    rect(x + 770, y + 570, 60, 60);
    textSize(72);
    stroke(0);
    strokeWeight(3);
    text("Game Over!", 285, 225);
    textSize(36);
    text("Retry or return to Main Menu", 235, 325);
    text("Retry?", 200, 550);
    text("Menu", 575, 550);
    noFill();
    stroke(0);
    strokeWeight(2);
    rect (150, 480, 200, 100);
    rect (525, 480, 200, 100);
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
