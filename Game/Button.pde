public class Button {
  float x, y;
  boolean on = false;
  int halfWide = 13;
  int tall = 13;
  color col;

  Button(float x, float y, color col) {
    this.x = x;
    this.y = y;
    this.col = col;
  }

  void drawButton() {
    noStroke();
    rectMode(CORNERS);
    fill(col);
    if (on) {
      rect(x - halfWide, y - tall + 5, x + halfWide, y);
    } else {
      rect(x - halfWide, y - tall, x + halfWide, y);
    }
    fill(238, 170, 24);
    rect(x - (halfWide + 4), y - (tall - 7), x + (halfWide + 4), y);
    
    noStroke();
  }

  void toggle(Fireboy fire, Watergirl water) {
    if ((fire.x + fire.halfWide >= x - halfWide && fire.x - fire.halfWide < x + halfWide) && (fire.y >= y - tall && fire.y <= y)) {
      if (!on) {
        on = true;
      }
    } else if ((water.x + water.halfWide >= x - halfWide && water.x - water.halfWide < x + halfWide) && (water.y >= y - tall && water.y <= y)) {
      if (!on) {
        on = true;
      }
    } else {
      on = false;
    }
    
  }
}
