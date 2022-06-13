import processing.sound.*;
class Door {
  float x, y, y2;
  boolean fire, water;
  int halfWide = 30;
  boolean doorPlayed = false;

  public Door(float x, float y, float y2, String define) {
    this.x = x;
    this.y = y;
    this.y2 = y2;
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
    if (!fireb.doorAct && !water) {
      fill(0);
      rect(x - 19, y - 59, x + 19, y);
      fill(113, 103, 51);
      rect(x - 19, y - 59, x + 19, y2);
      if(y2 <= y - 5) {
        y2+= 5;
      }
    } else if(fireb.doorAct && !water) {
      fill(0);
      rect(x - 19, y - 59, x + 19, y);
      fill(113, 103, 51);
      rect(x - 19, y - 59, x + 19, y2); 
      rect(x - 19, y - 5, x + 19, y); 
      rect(x - 14, y - 10, x + 14, y - 5); 
      rect(x - 9, y - 15, x + 9, y - 10); 
      if (y2 >= y - 59) {
        y2-=5;
      }
    }
    if (!waterg.doorAct && !fire) {
      rect(x - 19, y - 59, x + 19, y2);
      if(y2 <= y - 5) {
        y2+= 5;
      }
    } else if(waterg.doorAct && !fire) {
      fill(0);
      rect(x - 19, y - 59, x + 19, y);
      fill(113, 103, 51);
      rect(x - 19, y - 59, x + 19, y2);  
      rect(x - 19, y - 5, x + 19, y); 
      rect(x - 14, y - 10, x + 14, y - 5); 
      rect(x - 9, y - 15, x + 9, y - 10); 
      if (y2 >= y - 59) {
        y2-=5;
      }
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
        if (!fireboy.doorPlayed && !door.isPlaying()) {
          door.play();
          fireboy.doorPlayed = true;
        }
      }
    } else {
      fireboy.doorPlayed = false;
      fireboy.doorAct = false;
      if(door.isPlaying()) {
        door.pause();
      }
    }
  }

  void activateW(Watergirl watergirl) {
    if ((watergirl.x  >= x - halfWide && watergirl.x  <= x + halfWide) && (watergirl.y <= y + 65 && watergirl.y >= y)) {
      if (water == true) {
        watergirl.doorAct = true;
        if (!watergirl.doorPlayed && !door.isPlaying()) {
          door.play();
          watergirl.doorPlayed = true;
        }
      }
    } else {
      watergirl.doorAct = false;
      watergirl.doorPlayed = false;
      if(door.isPlaying()) {
        door.pause();
      }
    }
  }
}
