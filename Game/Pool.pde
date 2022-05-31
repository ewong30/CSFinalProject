public class Pool {
  float x, y;
  float wide;
  
  Pool(float x, float y, float wide) {
    this.x = x;
    this.y = y;
    this.wide = wide;
  }
  
  void drawPool() {
    noStroke();
    rectMode(CORNER);
    rect(x, y, wide, 20);
    triangle(x - 10, y, x, y + 20, x, y);
    triangle(x + (wide + 10), y, x + wide, y + 20, x, y);
  }
}
