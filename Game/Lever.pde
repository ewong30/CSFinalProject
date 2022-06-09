public class Lever {
  float x, y;
  boolean on = false;
  boolean hasBeen = false;

  Lever(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void drawLever(int x1, int y1, int x2, int y2, int x3) {
    noStroke();
    rectMode(CORNER);
    fill(238, 170, 24);
    rect(x, y, 50, 20);
    triangle(x - 10, y, x, y + 20, x, y);
    triangle(x + (50 + 10), y, x + 50, y + 20, x, y);
    stroke(238, 170, 24);
    strokeWeight(5);
    if (!on) {
      line(x1, y1, x2, y2);
    } else {
      line(223, 453, x3, y2);
    }
    noStroke();
  }

  void toggle(Fireboy fire, Watergirl water) {
    if ((fire.x >= x - 6 && fire.x <= x + 50 + 6) && (fire.y >= y - 20 && fire.y <= y)) {
      if (!on && !hasBeen && !fire.faceR) {
        on = true;
        hasBeen = true;
      } else if (on && !hasBeen && fire.faceR) {
        on = false;
        hasBeen = true;
      }
    } 
    else if ((water.x >= x - 6 && water.x <= x + 50 + 6) && (water.y >= y - 20 && water.y <= y)) {
      if (!on && !hasBeen && !water.faceR) {
        on = true;
        hasBeen = true;
      }
      else if (on && !hasBeen && water.faceR) {
        on = false;
        hasBeen = true;
      }
    }
    else {
      hasBeen = false;
    }
  }
}
