void setup() {
  size(1000, 800);
  textSize(128);
}

Character test = new Character(width/2, height/2);
Fireboy testFire = new Fireboy(width / 2, height/2);
Watergirl testWater = new Watergirl(width / 2, height/2);


void draw() {
  background(255);
  test.avatar();
  testFire.avatar();
  testWater.avatar();
}

//testing branch kate!!!

//movement:
void keyPressed() {
  if (key == 'q') {
    println("qUp");
  }
  if (key == 'e') {
    println("eUp");
  }
  if (key == 'w') {
    text("w", 20, 20);
  }  
  if (key == 's') {
    text("s", 20, 40);
  }  
  if (key == 'a') {
    testFire.fMove(true, 1);
  }  
  if (key == 'd') {
    testFire.fMove(true, 2);
  }
  if (keyCode == UP) {
    text("up", 20, 20);
  }
  if (keyCode == DOWN) {
    text("down", 20, 40);
  }
  if (key == 'j') {
    text("hi", 100, 100);
    testWater.wMove(true, 1);
  }
  if (key == 'l') {
    testWater.wMove(true, 2);
  }
}

void keyReleased() {
  if (key == 'q') {
    println("qDown");
  }
  if (key == 'e') {
    println("eDown");
  }
  if (key == 'w') {
    text("w", 20, 20);
  }
  if (key == 's') {
    text("s", 20, 40);
  }
  if (key == 'a') {
    testFire.fMove(false, 1);
  }
  if (key == 'd') {
    testFire.fMove(false, 2);
  }
  if (keyCode == UP) {
    text("up", 20, 20);
  }
  if (keyCode == DOWN) {
    text("down", 20, 40);
  }
  if (key == 'j') {
    text("bye", 100, 100);
    testWater.wMove(false, 1);
  }
  if (key == 'l') {
    testWater.wMove(false, 2);
  }
}
