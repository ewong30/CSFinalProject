PImage background;
Fireboy fire = new Fireboy(100, 675);
Watergirl water = new Watergirl(60, 675);

void setup() {
  size(900, 700);
  keyboardInput = new Controller();
  background = loadImage("background.png");
}


void draw() {
  image(background, 0, 0, 900, 700);
  water.avatar();
  fire.avatar();

  fire.jump();
  fire.xMove();
  
  water.jump();
  water.xMove();
}


Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
