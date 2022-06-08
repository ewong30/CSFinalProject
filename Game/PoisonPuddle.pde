public class PoisonPuddle extends Pool {
  
  PoisonPuddle(float x, float y, float wide) {
    super(x, y, wide, true, true);
  }
  
  void drawPool() {
    fill(62,150,36);
    super.drawPool();
  }
  
  
}
