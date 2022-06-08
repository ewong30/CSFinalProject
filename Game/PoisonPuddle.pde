public class PoisonPuddle extends Pool {
  
  PoisonPuddle(float x, float y, float wide) {
    super(x, y, wide);
  }
  
  void drawPool() {
    fill(62,150,36);
    super.drawPool();
  }
  
  void kill(Fireboy fire, Watergirl water) {
    if ((fire.x + fire.halfWide >= x - 10 && fire.x - fire.halfWide <= x + wide + 10) && (fire.y >= y - 5 && fire.y <= y + 20)) {
      fire.dead = true;
    } 
    if ((water.x + water.halfWide >= x - 10 && water.x - water.halfWide <= x + wide + 10) && (water.y >= y - 5 && water.y <= y + 20)) {
      water.dead = true;
    } 
  }
}
