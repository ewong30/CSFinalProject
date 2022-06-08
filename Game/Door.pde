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

  void drawDoor() {
    stroke(3);
    strokeWeight(2);
    rectMode(CORNERS);
    fill(113, 103, 51);
    rect(x - 30, y - 70, x + 30, y);   
    rect(x - 19, y - 59, x + 19, y);
    
    if (fire) {
      stroke(255, 55, 5);
      circle(x, y - 32, 18);
    }
    
    if (water) {
      stroke(49, 191, 255);
      circle(x, y - 32, 18);
    }

    noStroke();
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