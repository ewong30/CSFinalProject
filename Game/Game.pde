PImage background;
Fireboy fire = new Fireboy(60, 652);
Watergirl water = new Watergirl(60, 550);
 
boolean WIPmessage;

ArrayList<Platform> plats = new ArrayList<Platform>();
Platform plat1 = new Platform(24, 550, 350, 575);
Platform plat2 = new Platform(780, 585, 876, 652);
Platform plat3 = new Platform(450, 500, 730, 525);
Platform plat4 = new Platform(430, 475, 500, 500);
Platform plat5 = new Platform(24, 450, 475, 475);
Platform plat6 = new Platform(100, 365, 876, 390);
Platform plat7 = new Platform(24, 275, 776, 300);
Platform plat8 = new Platform(24, 205, 120, 275);
Platform plat9 = new Platform(220, 165, 876, 190);
Platform plat10 = new Platform(180, 140, 300, 165);
Platform plat11 = new Platform(220, 165, 320, 225);

Door fireDoor = new Door(655, 110, "fire");
Door waterDoor = new Door(750, 110, "water");
winScreen win = new winScreen(49, 48);

WaterPool wPool = new WaterPool(450, 652, 100);


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
  plats.add(plat7);
  plats.add(plat8);
  plats.add(plat9);
  plats.add(plat10);
  plats.add(plat11);
}

void draw() {
  image(background, 0, 0, 901, 675);
  fill(#908c4c);

  fireDoor.drawDoor();
  waterDoor.drawDoor();
  
  wPool.drawPool();
  wPool.killF(fire);
  
  if (fire.winF == false && fire.dead == false) {
    fire.avatar();
  }
  fireDoor.activateF(fire);
  fire.doorLeave(water);
  fire.jump();
  fire.xMove();

  
  if (water.winW == false) {
    water.avatar();
  }
  water.jump();
  waterDoor.activateW(water);
  water.doorLeave(fire);
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
  if (fire.winF == true && water.winW == true) {
    win.displayWin();
  }
  if (WIPmessage) {
    win.nextStage();
  }
}

Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void mouseClicked() {
  if ((win.winscreen) && (mouseX >= 200) && (mouseX <= 700) && (mouseY >= 475) && (mouseY <= 575)) {
    WIPmessage = true;
  }
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
