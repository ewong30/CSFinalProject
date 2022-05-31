public class LavaPool extends Pool {
  
  LavaPool(float x, float y, float wide) {
    super(x, y, wide);
  }
  
  
  void drawPool() {
    fill(#FF3705);
    super.drawPool();
  }
  
  void killW(Watergirl watergirl) {
    if ((watergirl.x >= x - 10 && watergirl.x <= x + wide + 10) && (watergirl.y >= y - 5 && watergirl.y <= y + 20)) {
      watergirl.dead = true;
    } 
  }
}
