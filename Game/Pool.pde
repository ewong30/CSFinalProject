public class Pool {
  float x, y;
  float wide;
  boolean killFire, killWater;
  
  Pool(float x, float y, float wide, boolean f, boolean w) {
    this.x = x;
    this.y = y;
    this.wide = wide;
    killFire = f;
    killWater = w;
  }
  
  void drawPool() {
    noStroke();
    rectMode(CORNER);
    
    if (killFire && killWater) {
      fill(62,150,36);
    } else if (killFire) {
      fill(62,150,36);
    } else if (killWater) {
      fill(62,150,36);
    }
    rect(x, y, wide, 20);
    triangle(x - 10, y, x, y + 20, x, y);
    triangle(x + (wide + 10), y, x + wide, y + 20, x, y);
  }
  
  void kill(Fireboy fire, Watergirl water) {
    if (killFire) {
      
      if ((fire.x + fire.halfWide >= x - 10 && fire.x - fire.halfWide <= x + wide + 10) && (fire.y >= y - 5 && fire.y <= y + 20)) {
        fire.dead = true;
      } 
    }
    if (killWater) {
      
      if ((water.x + water.halfWide >= x - 10 && water.x - water.halfWide <= x + wide + 10) && (water.y >= y - 5 && water.y <= y + 20)) {
        water.dead = true;
      } 
    }
  }
}
