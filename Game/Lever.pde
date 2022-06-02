public class Lever {
  float x, y;
  boolean on = false;

  Lever(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void drawLever(int x1, int y1, int x2, int y2) {
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
      line(223, 453, x2, y2);
    }
    noStroke();
  }
}
