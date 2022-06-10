import processing.sound.*;
public class Box extends Platform {
  boolean onWall = false;
  boolean onWallR = false;

  float dy = 0;

  public Box (int x1_, int y1_, int x2_, int y2_) {
    super(x1_, y1_, x2_, y2_);
  }

  void place() {
    fill(169);
    rectMode(CORNERS);
    rect(centX - 20, centY + 20, centX + 20, centY - 20);
  }

  boolean testStop(ArrayList<Platform> plats) {
    for (Platform p : plats) {
      if (((p.x2 >= x1 && p.x1 <= x1) || (p.x1 <= x2 && p.x2 >= x2)) && (p.y1 < y1 && p.y2 > y2)) {
        return true;
      }
    }
    if (x1 <= 135) {
      return true;
    }
    return false;
  }

  boolean activate(ArrayList<Platform> plats, Character player) {
    float distX = centX - player.x;
    float distY = centY - (player.y - 20);

    float sumHalfWidth = 15 + wide/2.0;
    float sumHalfHeight = 20 + high/2.0;

    onWall = testStop(plats);
    if(onWall) {
      player.boxToggle = true;
    }
    else {
      player.boxToggle = false;
    }
    
    x1 = centX - 20;
    x2 = centX + 20;

    if (Math.abs(distX) <= sumHalfWidth) {
      if (Math.abs(distY) <= sumHalfHeight) {
        float overlapX = sumHalfWidth - Math.abs(distX);
        float overlapY = sumHalfHeight - Math.abs(distY);
        if (overlapX < overlapY) {
          if (centX > player.x && !onWall) {
            centX += overlapX;
            x1 = centX - 20;
            x2 = centX + 20;
          } else {
            if (!onWall) {
              centX -= overlapX;
              x1 = centX - 20;
              x2 = centX + 20;
            }
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
