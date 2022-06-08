public class Gem {
  int x, y;
  int halfWide = 13;
  int tall = 20;
  boolean collected = false;

  Gem(int x_, int y_) {
    x = x_;
    y = y_;
  }

  void drawGem() {
    if (!collected) {
      fill(#FF3705);
      triangle(x - halfWide, y, x + halfWide, y, x, y + tall);
    }
  }

  void activate(Character chara) {
    if ((chara.x + chara.halfWide > x - halfWide && chara.x - chara.halfWide < x + halfWide) && (chara.y - chara.tall < y + tall && chara.y > y)) { //if inside the bounds of gem,
      if (!collected) {
        collected = true;
      }
    }
    
    println(collected);
  }
}
