import processing.sound.*;
class Door {
  float x, y;
  boolean fire, water;
  int halfWide = 30;

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

  void drawDoor(Fireboy fireb, Watergirl waterg) {
    stroke(3);
    strokeWeight(2);
    rectMode(CORNERS);
    fill(113, 103, 51);
    rect(x - halfWide, y - 70, x + halfWide, y);   
    if(!fireb.doorAct) {
    rect(x - 19, y - 59, x + 19, y);
    }
    
    if (fire && fireb.doorAct == false) {
      stroke(255, 55, 5);
      circle(x, y - 32, 18);
    }
    
    if (water && waterg.doorAct == false) {
      stroke(49, 191, 255);
      circle(x, y - 32, 18);
    }

    noStroke();
  }

  void activateF(Fireboy fireboy) {
    if ((fireboy.x >= x - halfWide && fireboy.x <= x + halfWide) && (fireboy.y <= y + 65 && fireboy.y >= y)) {
      if (fire == true) {
        fireboy.doorAct = true;
        //door.play();
      }
    } else {
      fireboy.doorAct = false;
    }
  }

  void activateW(Watergirl watergirl) {
    if ((watergirl.x  >= x - halfWide && watergirl.x  <= x + halfWide) && (watergirl.y <= y + 65 && watergirl.y >= y)) {
      if (water == true) {
        watergirl.doorAct = true;
        //door.play();
      }
    } else {
      watergirl.doorAct = false;
    }
  }
}
