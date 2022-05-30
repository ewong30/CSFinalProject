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
    if (keyboardInput.isPressed(Controller.FIRE_LEFT) && fire.detectBordersL()) {
      fire.x -= 5;
    }

    if (keyboardInput.isPressed(Controller.FIRE_RIGHT) && fire.detectBordersR()) {
      fire.x += 5;
    }
  }

  void jump() {
    if (fire.y < 675) {
      fire.dy += 1; //gravity when jumping
    } else {
      fire.dy = 0;
      if (keyboardInput.isPressed(Controller.FIRE_UP)) {
        fire.dy = -12;
      }
    }

    fire.y += fire.dy;

    while (fire.y > 675) {
      fire.y -= 1; //stabilize to floor
    }
  }
}
