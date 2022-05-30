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
    if (keyboardInput.isPressed(Controller.WATER_LEFT) && water.detectBordersL()) {
      water.x -= 5;
    }
    if (keyboardInput.isPressed(Controller.WATER_RIGHT) && water.detectBordersR()) {
      water.x += 5;
    }
  }

  void jump() {
    if (water.y < 675) {
      water.dy += 1;
    } else {
      water.dy = 0;
      if (keyboardInput.isPressed(Controller.WATER_UP)) {
        water.dy = -12;
      }
    }

    water.y += water.dy;

    while (water.y > 675) {
      water.y -= 1;
    }
  }
}
