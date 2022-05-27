PImage background;
Fireboy testFire = new Fireboy(width / 2 - 100, height/2 + 200);
Watergirl testWater = new Watergirl(width / 2 + 100, height/2 + 200);

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

  if (keyboardInput.isPressed(Controller.P1_LEFT)) {
    testFire.x -= 5;
  }
  //check if the button P1_RIGHT is being pressed:
  if (keyboardInput.isPressed(Controller.P1_RIGHT)) {
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
    testWater.y -= 5;
  }
  if (keyboardInput.isPressed(Controller.P2_UP)) {
    testFire.y -= 5;
  }
}

//testing branch kate!!!

Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
