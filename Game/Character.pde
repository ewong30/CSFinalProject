public class Character {
  int x, y;

  Character (int x, int y) {
    this.x = x;
    this.y = y;
  }  


  void avatar() {
    //your code here
    noStroke();
    fill(0, 0, 0);
    circle(x, y, 75);
  }
<<<<<<< HEAD
  //mType is move type, move given the type of move
  boolean detectBorders() {
    if (x <= 20 || x >= width - 20) 
      return false;
    if (y <= 20 || y >= height - 20)
      return false;
    else
      return true;
  }
=======

}
>>>>>>> 2a8f1205e906ac10fd75d382e7d26ceee054984d
