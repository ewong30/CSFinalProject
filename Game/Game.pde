PImage background;
Fireboy fire = new Fireboy(60, 652);
Watergirl water = new Watergirl(60, 560);

ArrayList<Platform> plats = new ArrayList<Platform>();
Platform plat1 = new Platform(0, 560, 350, 585);
Platform plat2 = new Platform(780, 585, 876, 652);

void setup() {
  size(900, 675);
  keyboardInput = new Controller();
  background = loadImage("background.png");
  
  plats.add(plat1);
  plats.add(plat2);
}

void draw() {
  image(background, 0, 0, 901, 675);
  fill(#908c4c);


  fire.avatar();
  fire.jump();
  fire.xMove();

  water.avatar();
  water.jump();
  water.xMove();

  for (Platform p : plats) {
    p.place();
    fire.isOnPlat = plat1.activate(fire) || p.activate(fire);
    water.isOnPlat = plat1.activate(water) || p.activate(water);
  }
}


Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
