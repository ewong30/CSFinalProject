public class Lever {
  float x, y;
  
  Lever(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void drawLever() {
    noStroke();
    rectMode(CORNER);
    rect(x, y - 20, 50, 20);
    triangle(x - 10, y, x, y + 20, x, y);
    triangle(x + (50 + 10), y, x + 50, y + 20, x, y);
  }
}
