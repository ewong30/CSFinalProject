public class Fireboy extends Character {
  Fireboy (int x, int y) {
    super(x, y);
  }

  void avatar() {
    noStroke();
    fill(200, 0, 0);
    circle(x, y, 75);
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
