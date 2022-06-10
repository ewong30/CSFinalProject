public class Box extends Platform {
  boolean onWall = false;
  boolean onWallR = false;
  boolean touchingPlayerL = false;
  boolean touchingPlayerR = false;
  float dy = 0;
  boolean canMove = true;


  public Box (int x1_, int y1_, int x2_, int y2_) {
    super(x1_, y1_, x2_, y2_);
  }

  void place() {
    fill(120);
    rectMode(CORNERS);
    rect(centX - 20, centY + 20, centX + 20, centY - 20);
  }

  boolean testMove(ArrayList<Platform> plats, Character player) { //width 
    boolean preBool = true;
    if ((x2 <= player.x - 35 || x1 >= player.x + 35) && player.y <= y1) {
      preBool = false;
    }
    for (Platform p : plats) {
      if (x1 <= p.x2 || x2 >= p.x1 && (y2 >= p.y2 && y1 <= p.y1)) {
        preBool = false;
      }
    }
    return preBool;
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
        println(overlapX + ", " + overlapY);
        if (overlapX < overlapY) {
          if (centX > player.x && !onWall) {
            centX += overlapX;
          } else {
            if (!onWall)
              centX -= overlapX;
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
