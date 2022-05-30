PImage background;
Fireboy fire = new Fireboy(100, 675);
Watergirl water = new Watergirl(60, 675);
Platform plat1 = new Platform(300,610,500,630);


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
  
  float distX = Math.abs(plat1.centX - fire.x);
  float distY = Math.abs(plat1.centY - (fire.high/2.0 + fire.y));
  
  float sumHalfWidth = fire.wide/2.0 + plat1.wide/2.0;
  float sumHalfHeight = fire.high/2.0 + plat1.high/2.0;
  
  
}


Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
