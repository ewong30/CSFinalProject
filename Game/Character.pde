public class Character {
  float x, y;

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
  boolean detectBorders() {
    if (x <= 25 || x >= width - 25) 
      return false;
    if (y <= 25 || y >= height - 25)
      return false;
    else
      return true;
  }

}
