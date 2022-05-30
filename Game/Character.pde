public class Character {
  float x, y;
  float dy = 0;

  Character (float x, float y) {
    this.x = x;
    this.y = y;
  }


  void avatar() {
    circle(x, y - 25, 28);
    rectMode(CORNERS);
    rect(x-8, y-25, x+8, y);
  }

  //mType is move type, move given the type of move
  boolean detectBordersL() {
    if (x <= 40) 
      return false;
    else
      return true;
  }
   boolean detectBordersR() {
    if (x >= width - 40) 
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
   boolean detectBordersD() {
    if (y >= height - 40) 
      return false;
    else
      return true;
  }
}
