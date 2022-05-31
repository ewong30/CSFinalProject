public class WaterPool extends Pool {
  
  WaterPool(float x, float y, float wide) {
    super(x, y, wide);
  }
  
  
  void drawPool() {
    fill(#31BFFF);
    super.drawPool();
  }
  
  void killF(Fireboy fireboy) {
    if ((fireboy.x >= x - 10 && fireboy.x <= x + wide + 10) && (fireboy.y >= y - 5 && fireboy.y <= y + 20)) {
      fireboy.dead = true;
    } 
  }
}
