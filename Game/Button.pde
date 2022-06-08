public class Button {
  float x, y;
  boolean on = false;
  int halfWide = 15;
  int tall = 13;

  Button(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void drawButton() {
    noStroke();
    rectMode(CORNERS);
    fill(238, 170, 24);
    rect(x - (halfWide + 3), y - (tall - 8), x + (halfWide + 3), y);
    if (on) {
      rect(x - halfWide, y - tall + 5, x + halfWide, y);
    } else {
      rect(x - halfWide, y - tall, x + halfWide, y);
    }
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
