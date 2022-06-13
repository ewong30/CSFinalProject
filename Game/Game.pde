import processing.sound.*;
PImage background;

Fireboy fire = new Fireboy(80, 652); //og: 80, 652
Watergirl water = new Watergirl(80, 550); //og: 80, 550

boolean WIPmessage;
boolean mainMenu = true;

Lever lever = new Lever(200, 450, #CBCE41);
Button button0 = new Button(270, 347, #CB41CE);
Button button1 = new Button(600, 250, #CB41CE);

SoundFile leverS;
SoundFile deathS;
SoundFile menuS;
SoundFile diamondS;
SoundFile jumpFBS;
SoundFile jumpWGS;
SoundFile imposter;
SoundFile door;

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

Door fireDoor = new Door(725, 138, 138, "fire");
Door waterDoor = new Door(825, 138, 138, "water");
Screen screen = new Screen(450, 337);

Pool wPool = new Pool(605, 652, 76, true, false);
Pool fPool = new Pool(450, 652, 76, false, true);
Pool pPool = new Pool(575, 500, 76, true, true);

Box box0 = new Box(395, 210, 435, 250);

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

  leverS = new SoundFile(this, "Lever.wav");
  deathS = new SoundFile(this, "Death.wav");
  menuS = new SoundFile(this, "Menu_Music.wav");
  diamondS = new SoundFile(this, "Diamond.wav");
  jumpFBS = new SoundFile(this, "Jump_fb.wav");
  jumpWGS = new SoundFile(this, "Jump_wg.wav");
  door = new SoundFile(this, "Door.wav");
  //door = new SoundFile(this, "Door.wav");
  // imposter = new SoundFile(this, "Imposter.wav");

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
  fireDoor.drawDoor(fire, water);
  waterDoor.drawDoor(fire, water);

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

  //instructions
  if (!WIPmessage && !screen.winscreen && !screen.deadScreen) {
    instruct();
  }

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


  cheat();

  //ending actions

  if (fire.winF == true && water.winW == true) {
    screen.displayWin();
    screen.completed = true;
  }
  if (fire.dead == true || water.dead == true) {
    screen.displayDead();
  }
  if (WIPmessage) {
    screen.WIP();
  }
  if (mainMenu) {
    screen.mainMenu(fire, water);
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
  }

  //prompt play again 
  if ((WIPmessage) && (mouseX >= 192) && (mouseX <= 451) && (mouseY >= 407) && (mouseY <= 458)) {
    reset();
  }

  if ((WIPmessage) && (mouseX >= 491) && (mouseX <= 668) && (mouseY >= 409) && (mouseY <= 463)) {
    mainMenu = true;
    WIPmessage = false;
  }

  if ((mainMenu) && (mouseX >= 380) && (mouseX <= 535) && (mouseY >= 255) && (mouseY <= 435)) {
    reset();
    mainMenu = false;
  }

  //prompt WIP (pressed continue)
  if ((screen.winscreen) && (mouseX >= 330) && (mouseX <= 570) && (mouseY >= 429) && (mouseY <= 485)) {
    WIPmessage = true;
    screen.winscreen = false;
  }

  //prompt WIP
  if ((screen.deadScreen) && (mouseX >= 490) && (mouseX <= 670) && (mouseY >= 409) && (mouseY <= 465)) {
    screen.deadScreen = false;
    mainMenu = true;
  }
}

void keyReleased() {
  keyboardInput.release(keyCode);
}

void reset() {
  lever.on = false;
  fire.mainM = false;
  water.mainM = false;

  fire.x = 100;
  fire.y = 652;

  water.x = 100;
  water.y = 550;

  box0.x1 = 380;
  box0.y1 = 210;
  box0.x2 = 420;
  box0.y2 = 250;

  fire.y = 652;
  fire.x = 80;
  water.y = 550;
  water.x = 80;

  fire.dead = false;
  water.dead = false;
  fire.winF = false;
  water.winW = false;
  fire.faceR = true;
  water.faceR = true;

  for (Gem g : gems) {
    g.collected = false;
  }

  WIPmessage = false;
  screen.deadScreen = false;
  screen.winscreen = false;
}

void instruct() {
  textSize(18);
  fill(#FFD900);
  textAlign(LEFT);
  if ((water.x >= 25 && water.x <= 380 && water.y <= 652 && water.y >= 475) || (fire.x >= 25 && fire.x <= 380 && fire.y <= 652 && fire.y >= 475)) {
    text("USE J.I.L\nTO MOVE WATERSUS", 140, 505);
    text("USE W.A.D\nTO MOVE FIRESUS", 140, 607);
  }
  if ((water.x > 380 && water.x <= 730 && water.y <= 652 && water.y >= 525) || (fire.x > 380 && fire.x <= 730 && fire.y <= 652 && fire.y >= 525)) {
    text("NEVER MIX FIRE AND WATER!", 450, 570);
  }
  if ((water.x > 730 && water.x <= 900 && water.y <= 585 && water.y >= 372) || (fire.x > 730 && fire.x <= 900 && fire.y <= 585 && fire.y >= 372)) {
    text("GREEN POISON KILLS THEM BOTH", 550, 438);
  }
  if ((water.x > 0 && water.x <= 730 && water.y <= 500 && water.y >= 372) || (fire.x > 0 && fire.x <= 730 && fire.y <= 500 && fire.y >= 372)) {
    text("LEVERS REMAIN AS YOU LEFT THEM", 150, 410);
  }
  if ((water.x > 0 && water.x <= 778 && water.y <= 347 && water.y >= 275) || (fire.x > 0 && fire.x <= 778 && fire.y <= 347 && fire.y >= 275)) {
    text("BUTTONS HOWEVER...", 400, 298);
    text("MUST BE HELD", 590, 325);
  }
  if ((water.x > 280 && water.x <= 778 && water.y <= 250 && water.y >= 165) || (fire.x > 280 && fire.x <= 778 && fire.y <= 250 && fire.y >= 165)) {
    text("YOU CAN INTERACT WITH OBJECTS", 455, 200);
  }
  if ((water.x > 0 && water.x <= 280 && water.y <= 250 && water.y >= 0) || (fire.x > 0 && fire.x <= 280 && fire.y <= 250 && fire.y >= 0)) {
    text("DONT FORGET TO\nGRAB SOME DIAMONDS!", 50, 60);
  }
  textAlign(RIGHT);
  if ((water.x > 280 && water.x <= 900 && water.y <= 140 && water.y >= 0) || (fire.x > 280 && fire.x <= 900 && fire.y <= 140 && fire.y >= 0)) {
    text("OPEN DOORS BY\nSTANDING IN FRONT OF THEM", 665, 60);
  }
}

void cheat() {
  if (keyboardInput.isPressed(Controller.INSTA_CLEAR)) {

    fire.mainM = false;
    water.mainM = false;

    fire.x = 100;
    fire.y = 652;

    water.x = 550;
    water.y = 100;

    fire.dead = false;
    water.dead = false;

    fire.winF = false;
    water.winW = false;

    fire.faceR = true;
    water.faceR = true;
  }
}
