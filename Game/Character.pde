public class Character {
  int x, y;

  Character (int x, int y) {
    this.x = x;
    this.y = y;
  }  

  boolean up, down, left, right;

  void avatar() {
    //your code here
    noStroke();
    fill(0, 0, 0);
    circle(x, y, 75);
  }
  //mType is move type, move given the type of move
  
}
