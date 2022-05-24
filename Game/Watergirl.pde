public class Watergirl extends Character {
  Watergirl (int x, int y) {
    super(x,y);
  }
  
  void avatar() {
    noStroke();
    fill(0,0,200);
    circle(x, y, 75);
  }
}
