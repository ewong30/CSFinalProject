public class Fireboy extends Character {
  Fireboy (float x, float y) {
    super(x, y);
  }

  void avatar() {
    noStroke();
    fill(#FF3705);
    super.avatar();
  }

  void xMove() {
    if (keyboardInput.isPressed(Controller.FIRE_LEFT) && detectBordersL()) {
      x -= 5;
    }

    if (keyboardInput.isPressed(Controller.FIRE_RIGHT) && detectBordersR()) {
      x += 5;
    }
  }

  void jump() {
    if (y >= 675 || isOnPlat) {
      dy = 0; //can jump when on floor
      if (keyboardInput.isPressed(Controller.FIRE_UP)) {
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
