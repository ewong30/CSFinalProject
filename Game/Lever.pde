

public class Lever {
  float x, y;
  boolean on = false;
  color col;
  

  Lever(float x, float y, color col) {
    this.x = x;
    this.y = y;
    this.col = col;
    
    //loading sound files;
  }

  void drawLever(int x1, int y1, int x2, int y2, int x3) {
    noStroke();
    rectMode(CORNER);
    fill(238, 170, 24);
    rect(x, y, 50, 15);
    triangle(x - 10, y, x, y + 15, x, y);
    triangle(x + (50 + 10), y, x + 50, y + 15, x, y);
    stroke(238, 170, 24);
    strokeWeight(5);
    if (!on) {
      line(x1, y1, x2, y2);
    } else {
      line(223, 453, x3, y2);
    }
    
    stroke(0);
    strokeWeight(2);
    fill(col);
    rect(x + 6, y + 3, 36, 7, 5, 5, 5, 5);
    noStroke();
  }

  void toggle(Fireboy fire, Watergirl water) {
    if ((fire.x >= x - 6 && fire.x <= x + 50 + 6) && (fire.y >= y - 20 && fire.y <= y)) {
      if (!on && !fire.faceR) {
        on = true;

        leverS.play();
      } else if (on && fire.faceR) {
        on = false;

        leverS.play();
      }
    } 
    else if ((water.x >= x - 6 && water.x <= x + 50 + 6) && (water.y >= y - 20 && water.y <= y)) {
      if (!on && !water.faceR) {
        on = true;

        leverS.play();
      }
      else if (on&& water.faceR) {
        on = false;

        leverS.play();
      }
    }
    //else {
    //  hasBeen = false;
    //}
  }
}
