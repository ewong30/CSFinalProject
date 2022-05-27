public class Fireboy extends Character {
  Fireboy (int x, int y) {
    super(x, y);
  }

  void avatar() {
    noStroke();
    fill(200, 0, 0);
    circle(x, y, 75);

    fill(200,0,0);
    //head of boy
    circle(x, y - 55, 28);

    rectMode(CENTER);
    //body
    rect(x, y - 28, 20, 25);
    
    //legs
    rect(x-6,y-7, 5,15);
    rect(x+6,y-7, 5,15);
<<<<<<< HEAD
    triangle(x-10,y - 30, x -5,y-30,x - 17,y - 10);
    triangle(x+10,y - 30, x +5,y-30,x+17,y - 10);
=======

    
    //arms
    triangle(x-10,y - 40, x -5,y-40,x - 17,y - 20);
    triangle(x+10,y - 40, x +5,y-40,x+17,y - 20);

>>>>>>> cc5be5012045d567091250794337e2eae841c003
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
