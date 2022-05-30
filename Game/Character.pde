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
    //your code here
    noStroke();
    fill(0, 0, 0);
    circle(x, y, 75);
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
