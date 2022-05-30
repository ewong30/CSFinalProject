PImage background;
Fireboy testFire = new Fireboy(100, 595);
Watergirl testWater = new Watergirl(60, 675);
static final int JUMP_HEIGHT = 16;

void setup() {
  size(900, 700);
  keyboardInput = new Controller();
  background= loadImage("background.png");
}


void draw() {
  image(background, 0, 0, 900, 700);
  //testWater.avatar();
  testFire.avatar();
  
  // fire jump
  if (testFire.y < 675) {
    testFire.dy += 1;
  } else {
    testFire.dy = 0;
    if (keyboardInput.isPressed(Controller.P1_UP) && testFire.canJump) {
      testFire.dy = -12;
    }
  }
  
  testFire.y += testFire.dy;
  
  while (testFire.y > 675) {
    testFire.y -= 1;
  }
  
  //fire left and right
  if (keyboardInput.isPressed(Controller.P1_LEFT) && testFire.x >= 25) {
    testFire.x -= 5;
  } 
  if (keyboardInput.isPressed(Controller.P1_RIGHT) && testFire.x >= 25) {
    testFire.x += 5;
  } 
  
  
  
  //water left and right
  /*
  if (keyboardInput.isPressed(Controller.P2_LEFT)) {
    testWater.x -= 5;
  }
  if (keyboardInput.isPressed(Controller.P2_RIGHT)) {
    testWater.x += 5;
  }
  */

  


  
  //water jump
  /*
  if (keyboardInput.isPressed(Controller.P2_UP) && testWater.canJump) {
    testWater.jumpCount += 8;
  }
   if (testWater.jumpCount > 0) {
    testWater.y -= JUMP_HEIGHT;
    testWater.jumpCount -= 1;
  }  
  */
}


Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
