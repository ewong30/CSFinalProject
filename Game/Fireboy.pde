public class Fireboy extends Character {
  Fireboy (int x, int y) {
    super(x, y);
  }

  void avatar() {
    noStroke();

    fill(200,0,0);
    //head of boy
    circle(x, y - 55, 28);

    rectMode(CENTER);
    //body
    rect(x, y - 28, 20, 25);
    
    //legs
    rect(x-6,y-7, 5,15);
    rect(x+6,y-7, 5,15);

    
    //arms
    triangle(x-10,y - 40, x -5,y-40,x - 17,y - 20);
    triangle(x+10,y - 40, x +5,y-40,x+17,y - 20);

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
