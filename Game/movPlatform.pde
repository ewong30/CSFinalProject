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
    this.x1Off = x1On;
    this.x2Off = x2On;
    this.y1Off = y1On;
    this.y2Off = y2On;
    this.x1On = x1On;
    this.x2On = x2On;
    this.y1On = y1On;
    this.y2On = y2On;
    state = lever.on;
  }

  void move(int oX, int oY, int nX, int nY) {
    //if lever is on / turned on
    if (state && (nY - oY)> 0) {
      if (y1 < nY) {
        y1 ++;
      }
    }
    if (state && (nY - oY)< 0) {
      if (y1 > nY) {
        y1 --;
      }
    } else if (state && (nX - oX)> 0) {
      if (x1 < nX) {
        x1 ++;
      }
    } else if (state && (nY - oY) < 0) {
      if (x1 > nX) {
        x1 --;
      }
    }
    //if lever is off / turned off
    if ((!state && (nY - oY)> 0) && (y1 < oY)) {
        y1 ++;
    }
    if ((!state && (nY - oY)< 0) && (y1 > oY)) {
        y1 --;
    }
    if ((!state && (nX - oX)> 0) && (x1 > oX)) {
        x1 ++;
    }
    if ((!state && (nY - oY) < 0) && (x1 > oX)) {
      if (x1 > oX) {
        x1 --;
      }
    }
  }
}
