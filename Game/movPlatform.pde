public class movPlatform extends Platform {
  int x1Off, y1Off, x2Off, y2Off;
  int x1On, y1On;
  boolean state;

  public movPlatform (Lever lever, int x1Off, int y1Off, int x2Off, int y2Off, int x1On, int y1On) {
    super(x1Off, y1Off, x2Off, y2Off);

    this.x1Off = x1Off;
    this.x2Off = x2Off;
    this.y1Off = y1Off;
    this.y2Off = y2Off;
    this.x1On = x1On;
    this.y1On = y1On;

    state = lever.on;
  }
  
  void place() {
    rectMode(CORNERS);
    fill(169);
    rect(x1, y1, x2, y2);
  }

  public movPlatform (Button button, int x1Off, int y1Off, int x2Off, int y2Off, int x1On, int y1On) {
    super(x1Off, y1Off, x2Off, y2Off);
    this.x1Off = x1Off;
    this.x2Off = x2Off;
    this.y1Off = y1Off;
    this.y2Off = y2Off;
    this.x1On = x1On;

    this.y1On = y1On;

    state = button.on;
  }

  void move(Lever lever) {
    //if lever is on / turned on
    state = lever.on;
    if ((state && (y1On - y1Off)> 0) && (super.y1 < y1On)) {
      super.y1 += 5;
      super.y2 += 5;
    } else if ((state && (y1On - y1Off)< 0) && (super.y1 > y1On)) {
      super.y1 -= 5;
      super.y2 -= 5;
    }
   
    //if lever is off / turned off
    if ((!state && (y1On - y1Off) < 0) && (super.y1 < y1Off)) {
      super.y1 += 5;
      super.y2 += 5;
    } else if ((!state && (y1On - y1Off) > 0) && (super.y1 > y1Off)) {
      super.y1 -= 5;
      super.y2 -= 5;
    }
  }
  
  void move(boolean state) {
    //if lever is on / turned on
    if ((state && (y1On - y1Off)> 0) && (super.y1 < y1On)) {
      super.y1 += 5;
      super.y2 += 5;
    } else if ((state && (y1On - y1Off)< 0) && (super.y1 > y1On)) {
      super.y1 -= 5;
      super.y2 -= 5;
    }
   
    //if lever is off / turned off
    if ((!state && (y1On - y1Off) < 0) && (super.y1 < y1Off)) {
      super.y1 += 5;
      super.y2 += 5;
    } else if ((!state && (y1On - y1Off) > 0) && (super.y1 > y1Off)) {
      super.y1 -= 5;
      super.y2 -= 5;
    }
  }

  //override to redefine bounds constantly
  boolean activate(Character player) {

    float centX = (super.x1 + super.x2) / 2.0;
    float centY = (super.y1 + super.y2) / 2.0;

    float high = Math.abs(super.y1 - super.y2);
    float wide = Math.abs(super.x1 - super.x2);

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
}
