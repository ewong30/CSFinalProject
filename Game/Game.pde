PImage background;
Fireboy fire = new Fireboy(60, 650);
Watergirl water = new Watergirl(60, 570);
Platform plat1 = new Platform(0, 570, 350, 595);
Platform plat2 = new Platform(800, 615, 875, 650);
Platform floor = new Platform(0,650,900,675);

void setup() {
  size(900, 675);
  keyboardInput = new Controller();
  background = loadImage("background.png");
}

void draw() {
  image(background, 0, 0, 901, 675);
  fill(#908c4c);
  rect(0,675,900,675);
  plat1.place();
  plat2.place();
  //floor.place();

  fire.avatar();
  fire.jump();
  fire.xMove();

  water.avatar();
  water.jump();
  water.xMove();

  fire.isOnPlat = plat1.activate(fire) || plat2.activate(fire);// || floor.activate(fire);
  water.isOnPlat = plat1.activate(water)|| plat2.activate(water);// || floor.activate(water);
  

}


Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
