import processing.sound.*;
PImage background;

Fireboy fire = new Fireboy(100, 652); //og: 100, 652
Watergirl water = new Watergirl(100, 550); //og: 100, 550

boolean WIPmessage;

Lever lever = new Lever(200, 450, #CBCE41);
Button button0 = new Button(270, 347, #CB41CE);
Button button1 = new Button(600, 250, #CB41CE);

ArrayList<Platform> plats = new ArrayList<Platform>();
Platform plat1 = new Platform(24, 550, 300, 575);
Platform plat2 = new Platform(780, 585, 876, 652);
Platform plat3 = new Platform(450, 500, 730, 525); // add pool to this one
Platform plat4 = new Platform(430, 475, 500, 500);
Platform plat5 = new Platform(24, 450, 475, 475); // same level as lever

Platform plat6 = new Platform(120, 347, 876, 372); // same as button0
Platform plat7 = new Platform(24, 250, 776, 275); //same as button1
Platform plat8 = new Platform(24, 145, 135, 250); // need box to get on

Platform plat9 = new Platform(295, 140, 876, 165); //long top one
Platform plat10 = new Platform(235, 115, 350, 140); // thin top one
Platform plat11 = new Platform(280, 140, 390, 200); // thick top one
Platform ceiling = new Platform(0, 0, 900, 25);

movPlatform mPlat = new movPlatform(lever, 24, 347, 118, 372, 24, 420);
movPlatform mPlat1 = new movPlatform(button0, 778, 250, 876, 275, 778, 320);

Door fireDoor = new Door(725, 138, "fire");
Door waterDoor = new Door(825, 138, "water");
Screen screen = new Screen(450, 337);

Pool wPool = new Pool(605, 652, 76, true, false);
Pool fPool = new Pool(450, 652, 76, false, true);
Pool pPool = new Pool(575, 500, 76, true, true);

Box box0 = new Box(380, 210, 420, 250);

ArrayList<Gem> gems = new ArrayList<Gem>();
Gem wgem0 = new Gem(643, 618, false);
Gem fgem0 = new Gem(488, 618, true);

Gem wgem1 = new Gem(545, 313, false);
Gem fgem1 = new Gem(185, 313, true);

Gem wgem2 = new Gem(555, 106, false);
Gem fgem2 = new Gem(290, 81, true);

Gem wgem3 = new Gem(60, 111, false);

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

  gems.add(wgem0);
  gems.add(fgem0);
  gems.add(wgem1);
  gems.add(fgem1);
  gems.add(wgem2);
  gems.add(fgem2);
  gems.add(wgem3);
}

void draw() {


  image(background, 0, 0, 901, 675);
  fill(#908c4c);

  //draw doors
  fireDoor.drawDoor();
  waterDoor.drawDoor();

  //places box
  box0.place();

  //platforms
  boolean fireOnPlat = box0.activate(plats, fire);
  boolean waterOnPlat = box0.activate(plats, water);

  boolean fireOnMovPlat;
  boolean waterOnMovPlat;

  for (Platform p : plats) {
    p.place();
    p.activate(box0);
    fireOnPlat = fireOnPlat || p.activate(fire);
    waterOnPlat = waterOnPlat || p.activate(water);
  }

  mPlat.place(lever.col);
  mPlat1.place(button0.col);

  fireOnMovPlat = mPlat.activate(fire) || mPlat1.activate(fire);
  waterOnMovPlat = mPlat.activate(water) || mPlat1.activate(water);

  fire.isOnPlat = fireOnPlat || fireOnMovPlat;
  water.isOnPlat = waterOnPlat || waterOnMovPlat;

  //lever
  lever.drawLever(223, 453, 244, 423, 194);
  lever.toggle(fire, water);
  mPlat.move(lever);

  //button
  button0.drawButton();
  button1.drawButton();

  button0.toggle(fire, water);
  button1.toggle(fire, water);
  mPlat1.move(button1.on || button0.on);

  //places box
  box0.place();
  ///box0.testMove(plats);
  ///box0.activate(plats, fire);
  ///box0.activate(plats, water);

  //gem
  for (Gem g : gems) {
    g.activate(fire, water);
    g.drawGem();
  }

  //pool actions
  wPool.drawPool();
  wPool.kill(fire, water);

  fPool.drawPool();
  fPool.kill(fire, water);

  pPool.drawPool();
  pPool.kill(fire, water);

  //fire actions
  if (fire.winF == false && fire.dead == false) {
    fire.avatar();
  }
  fireDoor.activateF(fire);
  fire.doorLeave(water);
  fire.jump();
  fire.xMove(plats, box0);

  //water actions
  if (water.winW == false && water.dead == false) {
    water.avatar();
  }
  water.jump();
  waterDoor.activateW(water);
  water.doorLeave(fire);
  water.xMove(plats, box0);

  //ending actions
  if (fire.winF == true && water.winW == true) {
    screen.displayWin();
  }
  if (fire.dead == true || water.dead == true) {
    screen.displayDead();
  }
  if (WIPmessage) {
    screen.WIP();
  }
}

Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);

  if (key == '`') {
    fire.x = 500;
    fire.y = 100;
    water.x = 500;
    water.y = 100;
  }
}

void mouseClicked() {
  //prompt retry
  if ((screen.deadScreen) && (mouseX >= 230) && (mouseX <= 410) && (mouseY >= 409) && (mouseY <= 465)) {
    reset();
    screen.deadScreen = false;
  }

  //prompt play again 
  if ((WIPmessage) && (mouseX >= 330) && (mouseX <= 570) && (mouseY >= 449) && (mouseY <= 505)) {
    reset();
    WIPmessage = false;
  }
  
  //prompt WIP (pressed continue)
  if ((screen.winscreen) && (mouseX >= 330) && (mouseX <= 570) && (mouseY >= 429) && (mouseY <= 485)) {
    WIPmessage = true;
    screen.winscreen = false;
  }

  //prompt WIP
  if ((screen.deadScreen) && (mouseX >= 490) && (mouseX <= 670) && (mouseY >= 409) && (mouseY <= 465)) {
    WIPmessage = true;
    screen.deadScreen = false;
  }
}

void keyReleased() {
  keyboardInput.release(keyCode);
}

void reset() {
  fire.y = 652;
  fire.x = 60;

  water.y = 550;
  water.x = 60;

  lever.on = false;

  fire.dead = false;
  water.dead = false;

  fire.winF = false;
  water.winW = false;

  fire.faceR = true;
  water.faceR = true;
}
