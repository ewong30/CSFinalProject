public class Fireboy extends Character {
  boolean doorAct = false;
  boolean winF = false;

  Fireboy (float x, float y) {
    super(x, y);
  }

  void avatar() {
    noStroke();
    fill(#FF3705);
    super.avatar();
  }

  void xMove() {
    if (winF == false) {
      if (keyboardInput.isPressed(Controller.FIRE_LEFT) && detectBordersL()) {
        x -= 6;
      }

      if (keyboardInput.isPressed(Controller.FIRE_RIGHT) && detectBordersR()) {
        x += 6;
      }
    }
  }

  void doorLeave() {
    if (keyboardInput.isPressed(Controller.FIRE_UP) && doorAct == true) {
      winF = true;
    }
  }

  void jump() {

    if ((y >= 652 || isOnPlat) && doorAct == false) {
      dy = 0; //can jump when on floor
      if (keyboardInput.isPressed(Controller.FIRE_UP)) {
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
