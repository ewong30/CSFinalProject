PImage background;
Fireboy fire = new Fireboy(100, 675);
Watergirl water = new Watergirl(60, 675);
Platform plat1 = new Platform(300, 610, 500, 675);


void setup() {
  size(900, 700);
  keyboardInput = new Controller();
  background = loadImage("background.png");
}


void draw() {
  image(background, 0, 0, 900, 700);
  plat1.place();

  water.avatar();
  fire.avatar();

  fire.jump();
  fire.xMove();

  water.jump();
  water.xMove();

  float distX = plat1.centX - fire.x;
  float distY = plat1.centY - (fire.y - fire.high/2.0);

  float sumHalfWidth = fire.wide/2.0 + plat1.wide/2.0;
  float sumHalfHeight = fire.high/2.0 + plat1.high/2.0;
  
  if (Math.abs(distX) < sumHalfWidth) {
    if (Math.abs(distY) < sumHalfHeight) {
      float overlapX = sumHalfWidth - Math.abs(distX);
      float overlapY = sumHalfHeight - Math.abs(distY);

      if (overlapX <= overlapY) {
        if (plat1.centX > fire.x) {
          fire.x -= overlapX;
        } else {
          fire.x += overlapX;
        }
      } else {
        if (plat1.centY > fire.y) {
          fire.y -= overlapY;
          fire.dy = 0;
        } else {
          fire.y += overlapY;
          fire.dy = 0;
        }
      }
    }
  }
}


Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
