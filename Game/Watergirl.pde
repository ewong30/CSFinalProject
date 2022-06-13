import processing.sound.*;
public class Watergirl extends Character {
  boolean winW = false;
  boolean dead = false;
  boolean canMove = true;
  boolean doorPlayed = false;
  boolean mainM = false;
  boolean cheatMove = false;


  Watergirl (float x, float y) {
    super(x, y);
  }

  void avatar() {
    noStroke();
    fill(#31BFFF);
    super.avatar();
  }

  void xMove(ArrayList<Platform> plats, Box box) {
    if ((winW == false || !mainM)) {
      if (keyboardInput.isPressed(Controller.WATER_LEFT) && detectBordersL(plats, box)) {
        x -= 8;
        faceR = false;
      }
      if (keyboardInput.isPressed(Controller.WATER_RIGHT) && detectBordersR(plats, box)) {
        x += 8;
        faceR = true;
      }
    }
  }

  void doorLeave(Fireboy fire) {
    if (fire.doorAct == true && doorAct == true) {
      winW = true;
    }
  }
  
  void cheat(ArrayList<Platform> plats, Box box) {
    if (keyboardInput.isPressed(Controller.INSTA_CLEAR)) {
      super.x = 790;
      super.y = 138;
      cheatMove = true;
    }
    if ((winW == false || !mainM)) {
      
      if (keyboardInput.isPressed(Controller.FIRE_LEFT) && detectBordersL(plats, box)) {
        x -= 8;
        faceR = false;
      }

      if (keyboardInput.isPressed(Controller.FIRE_RIGHT) && detectBordersR(plats, box)) {
        x += 8;
        faceR = true;
      }
    }
  }

  void jump() {
    if (((y >= 652 || isOnPlat) && doorAct == false) && !mainM){
      dy = 0; //can jump when on floor
      if (keyboardInput.isPressed(Controller.WATER_UP)) {
        dy = -13;
        jumpWGS.play();
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
