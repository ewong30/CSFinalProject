PImage background;
Fireboy fire = new Fireboy(150, 200);
Watergirl water = new Watergirl(160, 200);

boolean WIPmessage;

Lever lever = new Lever(200, 450);

ArrayList<Platform> plats = new ArrayList<Platform>();
Platform plat1 = new Platform(24, 550, 350, 575);
Platform plat2 = new Platform(780, 585, 876, 652);
Platform plat3 = new Platform(450, 500, 730, 525); // add pool to this one
Platform plat4 = new Platform(430, 475, 500, 500);
Platform plat5 = new Platform(24, 450, 475, 475); // same level as lever
Platform plat6 = new Platform(100, 365, 876, 390);
Platform plat7 = new Platform(24, 275, 776, 300);
Platform plat8 = new Platform(24, 205, 120, 275);
Platform plat9 = new Platform(220, 165, 876, 190);
Platform plat10 = new Platform(180, 140, 300, 165);
Platform plat11 = new Platform(220, 165, 320, 225);
Platform ceiling = new Platform(0, 0, 900, 25);

movPlatform mPlat = new movPlatform(lever, 24, 364, 98, 386, 24, 425, 475, 450);

Door fireDoor = new Door(725, 163, "fire");
Door waterDoor = new Door(825, 163, "water");
winScreen screen = new winScreen(49, 48);

WaterPool wPool = new WaterPool(625, 652, 90);
LavaPool fPool = new LavaPool(450, 652, 90);
PoisonPuddle pPool = new PoisonPuddle(575, 500, 75);

Box box0 = new Box(380, 235, 420, 275);

void setup() {
  size(900, 675);
  keyboardInput = new Controller();
  background = loadImage("background.png");

  plats.add(plat1);
  plats.add(plat2);
  plats.add(plat5);
  plats.add(plat4);
  plats.add(plat3);


  plats.add(plat6);
  plats.add(plat8);
  plats.add(plat7);

  plats.add(plat10);
  plats.add(plat9);

  plats.add(plat11);

  plats.add(ceiling);
}

void draw() {
  image(background, 0, 0, 901, 675);
  fill(#908c4c);

  //draw doors

  fireDoor.drawDoor();
  waterDoor.drawDoor();

  //places platforms
  boolean fireOnPlat = box0.activate(fire);
  boolean waterOnPlat = box0.activate(water);
  
  boolean fireOnMovPlat;
  boolean waterOnMovPlat;
  
  mPlat.place();
  fireOnMovPlat = (fireOnPlat || mPlat.activate(fire, lever));
  waterOnMovPlat = (waterOnPlat || mPlat.activate(water, lever));
  mPlat.move(lever, 24, 364, 24, 450);

  for (Platform p : plats) {
    p.place();
    p.activate(box0);
    fireOnPlat = fireOnPlat || p.activate(fire);
    waterOnPlat = waterOnPlat || p.activate(water);
  }

  //fireOnPlat = fireOnPlat || ;
  //waterOnPlat = waterOnPlat || ;
  fire.isOnPlat = fireOnPlat;
  water.isOnPlat = waterOnPlat;
  //places box
  box0.place();


  //pool actions
  wPool.drawPool();
  wPool.killF(fire);

  fPool.drawPool();
  fPool.killW(water);

  pPool.drawPool();
  pPool.kill(fire, water);

  //fire actions
  if (fire.winF == false && fire.dead == false) {
    fire.avatar();
  }

  fireDoor.activateF(fire);

  fire.doorLeave(water);
  fire.jump();
  fire.xMove();

  //water actions
  if (water.winW == false && water.dead == false) {
    water.avatar();
  }
  water.jump();
  waterDoor.activateW(water);
  water.doorLeave(fire);
  water.xMove();


  wPool.drawPool();
  wPool.killF(fire);

  fPool.drawPool();
  fPool.killW(water);

  pPool.drawPool();
  pPool.kill(fire, water);


  lever.drawLever(223, 453, 244, 423, 194);
  lever.toggle(fire, water);



  //ending actions
  if (fire.winF == true && water.winW == true) {
    screen.displayWin();
  }
  if (fire.dead == true || water.dead == true) {
    screen.displayDead();
  }
  if (WIPmessage) {
    screen.nextStage();
  }
}

Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void mouseClicked() {
  if ((screen.winscreen) && (mouseX >= 200) && (mouseX <= 700) && (mouseY >= 475) && (mouseY <= 575)) {
    WIPmessage = true;
  }
  if ((screen.deadScreen) && (mouseX >= 150) && (mouseX <= 350) && (mouseY >= 480) && (mouseY <= 580)) {
    fire.y = 652;
    water.y = 550;
    water.x = 60;
    fire.x = 60;
    fire.dead = false;
    water.dead = false;
    screen.deadScreen = false;
  }
  if ((screen.deadScreen) && (mouseX >= 525) && (mouseX <= 725) && (mouseY >= 480) && (mouseY <= 580)) {
    WIPmessage = true;
  }
  println(mouseX + " " + mouseY);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
