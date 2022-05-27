public class Character {
  int x, y;

  Character (int x, int y) {
    this.x = x;
    this.y = y;
  }  

  boolean up, down, left, right;
  
  boolean isMoving;
  
  void avatar() {
    //your code here
    noStroke();
    fill(0, 0, 0);
    circle(x, y, 75);
  }

}
