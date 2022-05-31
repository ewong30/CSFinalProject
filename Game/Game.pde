PImage background;
Fireboy fire = new Fireboy(60, 652);
Watergirl water = new Watergirl(60, 550);

ArrayList<Platform> plats = new ArrayList<Platform>();
Platform plat1 = new Platform(24, 550, 350, 575);
Platform plat2 = new Platform(780, 585, 876, 652);
Platform plat3 = new Platform(450, 500, 730, 525);
Platform plat4 = new Platform(430, 475, 500, 500);
Platform plat5 = new Platform(24, 450, 475, 475);
Platform plat6 = new Platform(100, 365, 876, 390);

void setup() {
  size(900, 675);
  keyboardInput = new Controller();
  background = loadImage("background.png");
  
  plats.add(plat1);
  plats.add(plat2);
  plats.add(plat3);
  plats.add(plat4);
  plats.add(plat5);
  plats.add(plat6);
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

  boolean fireOnPlat = false;
  boolean waterOnPlat = false;
  for (Platform p : plats) {
    p.place();
    fireOnPlat = fireOnPlat || p.activate(fire);
    waterOnPlat = waterOnPlat || p.activate(water);
  }
  fire.isOnPlat = fireOnPlat;
  water.isOnPlat = waterOnPlat;
}


Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
