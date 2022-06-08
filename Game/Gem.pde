public class Gem {
  int x, y;
  int halfWide = 13;
  int tall = 20;
  boolean collected = false;
  boolean isFire;

  Gem(int x_, int y_, boolean fire) {
    x = x_;
    y = y_;
    isFire = fire;
  }

  void drawGem() {
    if (!collected) {
      if (isFire) {
        fill(#FF3705);
        
      } else {
        fill(#31BFFF);
      }
      triangle(x - halfWide, y, x + halfWide, y, x, y + tall);
    }
  }

  void activate(Fireboy fire, Watergirl water) {
    if (isFire) {
      
      if ((fire.x + fire.halfWide > x - halfWide && fire.x - fire.halfWide < x + halfWide) && (fire.y - fire.tall < y + tall && fire.y > y)) { //if inside the bounds of gem,
        if (!collected) {
          collected = true;
        }
      }
    } else {
      if ((water.x + water.halfWide > x - halfWide && water.x - water.halfWide < x + halfWide) && (water.y - water.tall < y + tall && water.y > y)) { //if inside the bounds of gem,
        if (!collected) {
          collected = true;
        }
      }
    }
  }
}
