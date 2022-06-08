public class LavaPool extends Pool {
  
  LavaPool(float x, float y, float wide) {
    super(x, y, wide);
  }
  
  
  void drawPool() {
    fill(#FF3705);
    super.drawPool();
  }
  
  void killW(Watergirl water) {
    if ((water.x + water.halfWide >= x - 10 && water.x - water.halfWide <= x + wide + 10) && (water.y >= y - 5 && water.y <= y + 20)) {
      water.dead = true;
    } 
  }
}
