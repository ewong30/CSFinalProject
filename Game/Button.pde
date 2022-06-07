public class Button {
  float x, y;
  boolean on = false;
  boolean hasBeen = false;

  Button(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void drawButton() {
    noStroke();
    rectMode(CORNERS);
    fill(238, 170, 24);
    rect(x - 18, y - 13, x + 18, y);
    noStroke();
  }

  void toggle(Fireboy fire, Watergirl water) {
    if ((fire.x >= x - 6 && fire.x <= x + 50 + 6) && (fire.y >= y - 20 && fire.y <= y)) {
      if (!on && !hasBeen) {
        on = true;
        hasBeen = true;
      } else if (on && !hasBeen) {
        on = false;
        hasBeen = true;
      }
    } 
    else if ((water.x >= x - 6 && water.x <= x + 50 + 6) && (water.y >= y - 5 && water.y <= y + 20)) {
      if (!on && !hasBeen) {
        on = true;
        hasBeen = true;
      }
      else if (on && !hasBeen) {
        on = false;
        hasBeen = true;
      }
    }
    else {
      hasBeen = false;
    }
  }
}
