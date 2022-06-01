public class Watergirl extends Character {
  boolean doorAct;
  boolean winW = false;
  boolean dead = false;

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
        x -= 8;
      }
      if (keyboardInput.isPressed(Controller.WATER_RIGHT) && detectBordersR()) {
        x += 8;
      }
    }
  }

  void doorLeave(Fireboy fire) {
    if (fire.doorAct == true && doorAct == true) {
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
