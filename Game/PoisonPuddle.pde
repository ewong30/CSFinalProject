public class PoisonPuddle extends Pool {
  
  PoisonPuddle(float x, float y, float wide) {
    super(x, y, wide);
  }
  
  void drawPool() {
    fill(62,150,36);
    super.drawPool();
  }
  
  void kill(Fireboy fire, Watergirl water) {
    if ((fire.x >= x - 6 && fire.x <= x + wide + 6) && (fire.y >= y - 5 && fire.y <= y + 20)) {
      fire.dead = true;
    } 
    if ((water.x >= x - 6 && water.x <= x + wide + 6) && (water.y >= y - 5 && water.y <= y + 20)) {
      water.dead = true;
    } 
  }
}
