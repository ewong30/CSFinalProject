public class Platform {
  int x1, y1, x2, y2;
  float centX, centY;
  float high;
  float wide;
  
  Platform (int x1_, int y1_, int x2_, int y2_) {
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
    centX = (x1 + x2) / 2.0;
    centY = (y1 + y2) / 2.0;
    high = Math.abs(y1 - y2);
    wide = Math.abs(x1 - x2);
  }
  
  void place() {
    rectMode(CORNERS);
    fill(#908c4c);
    rect(x1, y1, x2, y2);
  }
  
  
}
