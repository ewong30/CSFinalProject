public class Lever {
  float x, y;
  
  Lever(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void drawLever(int x, int y) {
    noStroke();
    rectMode(CORNER);
    fill(238,170,24);
    rect(x, y, 50, 20);
    triangle(x - 10, y, x, y + 20, x, y);
    triangle(x + (50 + 10), y, x + 50, y + 20, x, y);
    stroke(238,170,24);
    strokeWeight(5);
    line(223, 453, x, y);
    noStroke();
  }
}
