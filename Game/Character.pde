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
    circle(x, y - 25, 30);
    rectMode(CORNERS);
    rect(x-8, y-25, x+8, y);
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
  
  //detectBordersD isn't used 
  boolean detectBordersD() {
    if (y >= height - 40) 
      return false;
    else
      return true;
  }
  
  
}
