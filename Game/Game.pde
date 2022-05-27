void setup() {
  size(900, 700);
  keyboardInput = new Controller();
  backdrop();
}

Character test = new Character(width/2, height/2);
Fireboy testFire = new Fireboy(width / 2 - 100, height/2);
Watergirl testWater = new Watergirl(width / 2 + 100, height/2);


void draw() {
  backdrop();
  test.avatar();
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
}
//testing branch kate!!!

Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
