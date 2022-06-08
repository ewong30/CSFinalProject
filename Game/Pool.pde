public class Pool {
  float x, y;
  float wide;
  float tall = 15;
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
      fill(62, 150, 36);
    } else if (killFire) {
      fill(#31BFFF);
    } else if (killWater) {
      fill(#FF3705);
    }
    rect(x, y, wide, tall);
    triangle(x - 10, y, x, y + tall, x, y);
    triangle(x + (wide + 10), y, x + wide, y + tall, x, y);
  }

  void kill(Fireboy fire, Watergirl water) {
    if (killFire) {
      if ((fire.x + fire.halfWide >= x && fire.x - fire.halfWide <= x + wide) && (fire.y >= y - 5 && fire.y <= y + 20)) {
        fire.dead = true;
      }
    }
    if (killWater) {

      if ((water.x + water.halfWide >= x && water.x - water.halfWide <= x + wide) && (water.y >= y - 5 && water.y <= y + 20)) {
        water.dead = true;
      }
    }
  }
}
