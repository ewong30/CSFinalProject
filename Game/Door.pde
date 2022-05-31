class Door {
  float x, y;
  boolean fire, water;

  public Door(float x, float y, String define) {
    this.x = x;
    this.y = y;
    if (define.equals("fire")) {
      fire = true;
    }
    if (define.equals("water")) {
      water = true;
    }
  }

  void drawDoor(Fireboy fireboy, Watergirl watergirl) {
    stroke(4);
    rectMode(CORNER);
    fill(113, 103, 51);
    rect(x, y, 55, 65);
    if (fire && !fireboy.doorAct) {
      fill(113, 103, 51);
      rect(x + 5, y + 5, 45, 50);
    } else if (water && !watergirl.doorAct) {
      fill(113, 103, 51);
      rect(x + 5, y + 5, 45, 50);
    }
    else {
      fill(0);
      rect(x + 5, y + 5, 45, 50);
    }
    if (fire && !fireboy.doorAct) {
      stroke(255, 55, 5);
      strokeWeight(2);
      circle(x + 27, y + 32, 20);
      line(x + 33, y + 24, x + 44, y + 16);
      line(x + 33, y + 13, x + 44, y + 16);
      line(x + 45, y + 27, x + 44, y + 16);
    }
    if (water && !watergirl.doorAct) {
      stroke(49, 191, 255);
      strokeWeight(2);
      circle(x + 27, y + 25, 20);
      line(x + 27, y + 35, x + 27, y + 47);
      line(x + 20, y + 40, x + 35, y + 40);
      stroke(0, 0, 0);
    }
  }

  void activateF(Fireboy fireboy) {
    if ((fireboy.x >= x && fireboy.x <= x + 55) && (fireboy.y <= y + 65 && fireboy.y >= y)) {
      if (fire == true) {
        fireboy.doorAct = true;
      }
    } else {
      fireboy.doorAct = false;
    }
  }

  void activateW(Watergirl watergirl) {
    if ((watergirl.x >= x && watergirl.x <= x + 55) && (watergirl.y <= y + 65 && watergirl.y >= y)) {
      if (water == true) {
        watergirl.doorAct = true;
      }
    } else {
      watergirl.doorAct = false;
    }
  }
}
