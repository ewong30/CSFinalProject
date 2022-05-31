public class Watergirl extends Character {
  boolean doorAct;
  boolean winW = false;

  Watergirl (float x, float y) {
    super(x, y);
  }

  void avatar() {
    noStroke();
    fill(#31BFFF);
    super.avatar();
  }

  void xMove() {
    if (winW == false) {
      if (keyboardInput.isPressed(Controller.WATER_LEFT) && detectBordersL()) {
        x -= 6;
      }
      if (keyboardInput.isPressed(Controller.WATER_RIGHT) && detectBordersR()) {
        x += 6;
      }
    }
  }

  void doorLeave() {
    if (keyboardInput.isPressed(Controller.WATER_UP) && doorAct == true) {
      winW = true;
    }
  }

  void jump() {
    if ((y >= 652 || isOnPlat) && doorAct == false) {
      dy = 0; //can jump when on floor
      if (keyboardInput.isPressed(Controller.WATER_UP)) {
        dy = -13;
      }
    } else {
      dy += 1; //gravity when not on floor
    }

    y += dy;

    while (y > 652) {
      y -= 1;
    }
  }
}
