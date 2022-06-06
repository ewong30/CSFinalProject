public class movPlatform extends Platform {
  int x1, x2, y1, y2;
  int x1Off, y1Off, x2Off, y2Off, x1On, y1On, x2On, y2On;
    boolean state;

  public movPlatform (Lever lever, int x1Off, int y1Off, int x2Off, int y2Off, int x1On, int y1On, int x2On, int y2On) {
    super(x1Off, y1Off, x2Off, y2Off);
    x1 = x1Off;
    x2 = x2Off;
    y1 = y1Off;
    y2 = y2Off;
    this.x1Off = x1Off;
    this.x2Off = x2Off;
    this.y1Off = y1Off;
    this.y2Off = y2Off;
    this.x1On = x1On;
    this.x2On = x2On;
    this.y1On = y1On;
    this.y2On = y2On;
    state = lever.on;
  }

  void move(Lever lever, int oX, int oY, int nX, int nY) {
    //if lever is on / turned on
    state = lever.on;
    if ((state && (nY - oY)> 0) && (super.y1 < nY)) {
        super.y1 += 5;
        super.y2 += 5;
    }
    else if ((state && (nY - oY)< 0) && (super.y1 > nY)) {
        super.y1 -= 5;
        super.y2 -= 5;
    } else if ((state && (nX - oX)> 0) && (super.x1 < nX)) {
        super.x1 += 5;
        super.x2 += 5;
    } else if ((state && (nY - oY) < 0) && (super.x1 > nX)) {
        super.x1 -= 5;
        super.x2 -= 5;
    }
    //if lever is off / turned off
    if ((!state && (nY - oY) < 0) && (super.y1 < oY)) {
        super.y1 += 5;
        super.y2 += 5;
    }
    else if ((!state && (nY - oY) > 0) && (super.y1 > oY)) {
        super.y1 -= 5;
        super.y2 -= 5;
    } else if ((!state && (nX - oX) < 0) && (super.x1 < oX)) {
        super.x1 += 5;
        super.x2 += 5;
    } else if ((!state && (nY - oY) > 0) && (super.x1 > oX)) {
        super.x1 -= 5;
        super.x2 -= 5;
    }
  }
  
  //override to redefine bounds constantly
  boolean activate(Character player) {

    float distX = centX - player.x;
    float distY = centY - (player.y - 20);
    
    float sumHalfWidth = 15 + wide/2.0;
    float sumHalfHeight = 20 + high/2.0;
    
    float centX = (super.x1 + super.x2) / 2.0;
    float centY = (super.y1 + super.y2) / 2.0;
    int high = Math.abs(y1 - y2);
    int wide = Math.abs(x1 - x2);

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
}
