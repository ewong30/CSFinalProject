public class WaterPool extends Pool {
  
  WaterPool(float x, float y, float wide) {
    super(x, y, wide);
  }
  
  
  void drawPool() {
    fill(#31BFFF);
    super.drawPool();
  }
  
  void killF(Fireboy fireboy) {
    if ((fire.x + fire.halfWide > x - 10 && fire.x - fire.halfWide < x + wide + 10) && (fire.y >= y - 5 && fire.y <= y + 20)) {
      fireboy.dead = true;
    } 
  }
}
