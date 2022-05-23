public class Fireboy extends Character {
  Fireboy (int x, int y) {
    super(x,y);
  }
    
  void avatar() {
    noStroke();
    fill(200,0,0);
    circle(x, y, 75);
  }
}
