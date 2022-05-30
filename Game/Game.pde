PImage background;
Fireboy fire = new Fireboy(100, 595);
Watergirl water = new Watergirl(60, 675);
static final int JUMP_HEIGHT = 16;

void setup() {
  size(900, 700);
  keyboardInput = new Controller();
  background= loadImage("background.png");
}


void draw() {
  image(background, 0, 0, 900, 700);
  water.avatar();
  fire.avatar();
  
  // fire jump
  if (fire.y < 675) {
    fire.dy += 1;
  } else {
    fire.dy = 0;
    if (keyboardInput.isPressed(Controller.FIRE_UP)) {
      fire.dy = -12;
    }
  }
  
  fire.y += fire.dy;
  
  while (fire.y > 675) {
    fire.y -= 1;
  }
  
  //fire left and right
  if (keyboardInput.isPressed(Controller.FIRE_LEFT) && fire.x >= 25) {
    if(fire.detectBordersL())
    fire.x -= 5;
  }

  if (keyboardInput.isPressed(Controller.FIRE_RIGHT) && fire.x <= 875) {
    if(fire.detectBordersR())
    fire.x += 5;
  } 
  
  
  // water jump
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
  
  if (keyboardInput.isPressed(Controller.WATER_LEFT)) {
    if(water.detectBordersL())
    water.x -= 5;
  }
  if (keyboardInput.isPressed(Controller.WATER_RIGHT)) {
    if(water.detectBordersR())
    water.x += 5;
  }

}


Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
