void setup() {
  size(900, 700);
<<<<<<< HEAD
  keyboardInput = new Controller();
  backdrop();
=======
  background= loadImage("background.png");
>>>>>>> 5d899902e728e1047bdc826160e13623487351ab
}
PImage background;
Character test = new Character(width/2, height/2);
Fireboy testFire = new Fireboy(width / 2 - 100, height/2);
Watergirl testWater = new Watergirl(width / 2 + 100, height/2);


void draw() {
<<<<<<< HEAD
  backdrop();
  test.avatar();
  testFire.avatar();
  testWater.avatar();
=======
  image(background, 0, 0, 900, 700);

  Character test = new Character(width/2, height/2);
  Fireboy testFire = new Fireboy(75, 675);
  Watergirl testWater = new Watergirl(width / 2 + 100, height/2);

  /*
  test.avatar();
   testFire.avatar();
   testWater.avatar();
   */
}
//testing branch kate!!!
>>>>>>> 5d899902e728e1047bdc826160e13623487351ab

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
