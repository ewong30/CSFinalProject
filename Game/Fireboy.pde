public class Fireboy extends Character {
  Fireboy (int x, int y) {
    super(x, y);
  }

  void avatar() {
    noStroke();

    fill(200,0,0);
    //head of boy
    circle(x, y - 45, 30);
    rectMode(CENTER);
    rect(x, y - 20, 20, 20);
    rect(x-6,y-7, 5,15);
    rect(x+6,y-7, 5,15);
    triangle(x-10,y - 30, x -5,y-30,x - 17,y - 10);
    triangle(x+10,y - 30, x +5,y-30,x+17,y - 10);

  }
  void fMove(boolean mov, int mType) {
    if (mov) {
        if (mType == 1) {
          x -= 5;
        }  
        if (mType == 2) {
          x += 5;
        }
      
    }
  }
}
