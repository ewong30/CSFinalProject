public class Watergirl extends Character {
  Watergirl (int x, int y) {
    super(x,y);
  }
  
  void avatar() {
    noStroke();
    fill(0,0,200);
    circle(x, y, 75);
  }
  
  void wMove(boolean mov, int mType) {
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
