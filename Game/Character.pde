public class Character {
  float x, y;
  boolean canJump  = true;
  int jumpCount = 0;

  Character (float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void gravity() {
    y += 10; 
  }


  void avatar() {
    circle(x, y - 25, 28);
    rectMode(CORNERS);
    rect(x-8, y-25, x+8, y);
  }
  
  //mType is move type, move given the type of move
  boolean detectBorders() {
    if (x <= 25 || x >= width - 25) 
      return false;
    if (y <= 25 || y >= height - 25)
      return false;
    else
      return true;
  }

}
