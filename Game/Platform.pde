public class Platform {
  int x1, y1, x2, y2;
  float centX, centY;
  float high;
  float wide;

  boolean state;

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

  boolean activate(Character player) {

    float distX = centX - player.x;
    float distY = centY - (player.y - 20);
    
    float sumHalfWidth = 15 + wide/2.0;
    float sumHalfHeight = 20 + high/2.0;

    if (Math.abs(distX) <= sumHalfWidth) {
      if (Math.abs(distY) <= sumHalfHeight) {
        float overlapX = sumHalfWidth - Math.abs(distX);
        float overlapY = sumHalfHeight - Math.abs(distY);

        if (overlapX < overlapY) {
          if (centX > player.x) {
            player.x -= overlapX;
            
          } else {
            player.x += overlapX;
            
          }
        } else {
          if (centY > player.y) {
            player.y -= overlapY;
            player.dy = 0;
            
            return true;
          } else {
            player.y += overlapY;
            player.dy = 0;
            
          }
        }
      }
    }
    return false;
  }
  
  void activate(Box player) {

    float distX = centX - player.centX;
    float distY = centY - (player.centY - 20);
    
    float sumHalfWidth = player.wide/2.0 + wide/2.0;
    float sumHalfHeight = player.high/2.0 + high/2.0;

    if (Math.abs(distX) <= sumHalfWidth) {
      if (Math.abs(distY) <= sumHalfHeight) {
        float overlapX = sumHalfWidth - Math.abs(distX);
        float overlapY = sumHalfHeight - Math.abs(distY);

        if (overlapX < overlapY) {
          if (centX > player.centX) {
            player.centX -= overlapX;
            
          } else {
            player.centX += overlapX;
            
          }
        }
      }
    }
  }
}
