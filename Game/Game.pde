PImage background;
Fireboy testFire = new Fireboy(100, 675);
Watergirl testWater = new Watergirl(60, 675);
int p1UpCounter = 0;
int p2UpCounter = 0;

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

  p1UpCounter--;
  
  if (keyboardInput.isPressed(Controller.P1_LEFT) && testFire.x >= 25) {
      testFire.x -= 5;
  }
  //check if the button P1_RIGHT is being pressed:
  if (keyboardInput.isPressed(Controller.P1_RIGHT) && testFire.x <= 875) {
    testFire.x += 5;
  }
  if (keyboardInput.isPressed(Controller.P2_LEFT)) {
    testWater.x -= 5;
  }
  //check if the button P1_RIGHT is being pressed:
  if (keyboardInput.isPressed(Controller.P2_RIGHT)) {
    testWater.x += 5;
  }
  
  if (keyboardInput.isPressed(Controller.P1_UP)) {
    if (p1UpCounter == 0) {
      p1UpCounter += 5;
    }
    if (p1UpCounter <= 5) {
      testFire.y -= 20;
    }
    
  }
  if (keyboardInput.isPressed(Controller.P2_UP)) {
    testWater.y -= 20;
  }
  
  
  if (testFire.y < 675) {
    testFire.gravity();
  }
  if (testWater.y < 675) {
    testWater.gravity();
  }
}

Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
