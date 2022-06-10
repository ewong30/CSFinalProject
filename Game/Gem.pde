import processing.sound.*;
public class Gem {
  int x, y;
  int halfWide = 13;
  int tall = 15;
  boolean collected = false;
  boolean isFire;

  Gem(int x_, int y_, boolean fire) {
    x = x_;
    y = y_;
    isFire = fire;
  }

  void drawGem() {
    if (!collected) {
      //stroke(0, 130);
      noStroke();
      if (isFire) {
        fill(#FF3705);
      } else {
        fill(#31BFFF);
      }
      triangle(x - halfWide, y, x + halfWide, y, x, y + tall);
      rectMode(CORNERS);
      rect(x - (halfWide - 6), y, x + (halfWide - 6), y - 6);
      triangle(x - halfWide, y, x - (halfWide - 6), y, x - (halfWide - 6), y - 6);
      triangle(x + halfWide, y, x + (halfWide - 6), y, x + (halfWide - 6), y - 6);
      noStroke();
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
