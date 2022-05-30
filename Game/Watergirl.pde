public class Watergirl extends Character {
  Watergirl (float x, float y) {
    super(x, y);
  }

  void avatar() {
    noStroke();
    fill(#31BFFF);
    super.avatar();
  }

  void xMove() {
    if (keyboardInput.isPressed(Controller.WATER_LEFT) && detectBordersL()) {
      x -= 5;
    }
    if (keyboardInput.isPressed(Controller.WATER_RIGHT) && detectBordersR()) {
      x += 5;
    }
  }

  void jump() {
    if (y >= 675 || isOnPlat) {
      dy = 0; //can jump when on floor
      if (keyboardInput.isPressed(Controller.WATER_UP)) {
        dy = -12;
      }
    } else {
      dy += 1; //gravity when not on floor
    }

    y += dy;

    while (y > 675) {
      y -= 1;
    }
  }
}
