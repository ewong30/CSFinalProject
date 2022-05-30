public class Watergirl extends Character {
  Watergirl (int x, int y) {
    super(x,y);
  }
  
  void avatar() {
    noStroke();
    fill(#31BFFF);
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
  
}
