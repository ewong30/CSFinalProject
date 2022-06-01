public class Character {
  float x, y;
  float dy = 0;
  float high = 40;
  float wide = 30;
  boolean isOnPlat = false;
  boolean win;

  Character (float x, float y) {
    this.x = x;
    this.y = y;
  }

  void avatar() {
    rectMode(CORNERS);
    rect(x-15, y-25, x-2, y, 0,0,3,3);
    rect(x+15, y-25, x+2, y, 0,0,3,3);
    rect(x-15, y-25, x+15, y-7);
    circle(x, y - 28, 30);
    
    stroke(0,130);
    fill(60, 95, 110);
    strokeWeight(2);
    rect(x-2, y-21, x+19,y - 32, 4, 4, 4, 4);
    noStroke();
  }

  boolean detectBordersL() {
    if (x <= 42) 
      return false;
    else
      return true;
  }
  boolean detectBordersR() {
    if (x >= width - 42) 
      return false;
    else
      return true;
  }
  boolean detectBordersU() {
    if (y <= 40) 
      return false;
    else
      return true;
  }
}
