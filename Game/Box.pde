public class Box extends Character {
  int centX, centY;
  public Box(int x1_, int y1_) {
    super(x1_, y1_);
    centX = x1_;
    centY = y1_ + 20;
  }

  void avatar() {
    rectMode(CORNERS);
    rect(x-20, y-40, x+20, y);
  }

  boolean activate(Character player) {
    float distX = centX - player.x;
    float distY = centY - (player.y - 20);

    float sumHalfWidth = 15 + 20;
    float sumHalfHeight = 20 + 20;

    if (Math.abs(distX) <= sumHalfWidth) {
      if (Math.abs(distY) <= sumHalfHeight) {
        float overlapX = sumHalfWidth - Math.abs(distX);
        float overlapY = sumHalfHeight - Math.abs(distY);
        println(overlapX,overlapY);
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
}
