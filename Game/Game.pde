PImage background;
Fireboy testFire = new Fireboy(100, 675);
Watergirl testWater = new Watergirl(60, 675);

void setup() {
  size(900, 700);
  keyboardInput = new Controller();
  background= loadImage("background.png");
}


void draw() {
  testFire.avatar();
  testWater.avatar();
  image(background, 0, 0, 900, 700);

  testFire.avatar();
  testWater.avatar();
  
  if (testFire.y < 675) {
    testFire.gravity();
    testFire.canJump = false;
  } else {
    testFire.canJump = true;
  }
  
  if (testWater.y < 675) {
    testWater.gravity();
    testWater.canJump = false;
  } else {
    testWater.canJump = true;
  }
  
  if (keyboardInput.isPressed(Controller.P1_LEFT) && testFire.x >= 25) {
    if(testFire.detectBordersL())
    testFire.x -= 5;
  }
  //check if the button P1_RIGHT is being pressed:
  if (keyboardInput.isPressed(Controller.P1_RIGHT) && testFire.x <= 875) {
    if(testFire.detectBordersR())
    testFire.x += 5;
  }
  if (keyboardInput.isPressed(Controller.P2_LEFT)) {
    if(testWater.detectBordersL())
    testWater.x -= 5;
  }
  //check if the button P1_RIGHT is being pressed:
  if (keyboardInput.isPressed(Controller.P2_RIGHT)) {
    if(testWater.detectBordersR())
    testWater.x += 5;
  }

  if (keyboardInput.isPressed(Controller.P1_UP) && testFire.canJump) {
    testFire.jumpCount += 8;
  }
  if (testFire.jumpCount > 0) {
    testFire.y -= 20;
    testFire.jumpCount -= 1;
  }  
  
  if (keyboardInput.isPressed(Controller.P2_UP) && testWater.canJump) {
    testWater.jumpCount += 8;
  }
   if (testWater.jumpCount > 0) {
    testWater.y -= 20;
    testWater.jumpCount -= 1;
  }  

  
}

Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
