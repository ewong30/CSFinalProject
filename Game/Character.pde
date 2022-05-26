public class Character {
  int x, y;
  Character (int x, int y) {
    this.x = x;
    this.y = y;
  }  
  
  boolean isMoving;
  
  void avatar() {
    //your code here
    noStroke();
    fill(0,0,0);
    circle(x, y, 75);
  }
  
  void moveL(boolean move) {
    if(move) {
      isMoving = true;
    }
    if(!move) isMoving = false;
    while(isMoving) {
      x-=5;
    }
  }
  void moveR(boolean move) {
    if(move) {
      isMoving = true;
    }
    if(!move) isMoving = false;
    while(isMoving) {
      x+=5;
    }
  }
}
