public class Fireboy extends Character {
  boolean doorAct = false;
  boolean winF = false;
  boolean dead = false;
  boolean canMove = true;

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
        x -= 8;
        faceR = false;
      }

      if (keyboardInput.isPressed(Controller.FIRE_RIGHT) && detectBordersR()) {
        x += 8;
        faceR = true;
      }
    }
  }

  void doorLeave(Watergirl water) {
    if (water.doorAct == true && doorAct == true) {
      winF = true;
    }
  }

  void jump() {
    if ((y >= 652 || isOnPlat || isOnBox) && doorAct == false) {
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
