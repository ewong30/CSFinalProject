void setup() {
  size(1000, 800);
  backdrop();
}

Character test = new Character(width/2, height/2);
Fireboy testFire = new Fireboy(width / 2 - 100, height/2);
Watergirl testWater = new Watergirl(width / 2 + 100, height/2);


void draw() {
  
<<<<<<< HEAD
=======
  Character test = new Character(width/2, height/2);
  Fireboy testFire = new Fireboy(75, 675);
  Watergirl testWater = new Watergirl(width / 2 + 100, height/2);
>>>>>>> cc829ac13d9e6cc8937d05094bf89a1abc3e6a8f
  test.avatar();
  testFire.avatar();
  testWater.avatar();
}
//testing branch kate!!!

//movement:
void keyPressed() {
  if (key == 'w') {
    text("w", 20, 20);
  }
  if (key == 's') {
    text("s", 20, 40);
  }
  if (key == 'a') {
    text("a", 20, 60);
  }
  if (key == 'd') {
    text("w", 20, 80);
  }
  if (keyCode == UP) {
  }
  if (keyCode == DOWN) {
    text("down", 20, 40);
  }
  if (keyCode == LEFT) {
    testWater.moveL(true);
  }
  if (keyCode == RIGHT) {
    testWater.moveR(true);
  }
}

void keyReleased() {
  if (key == 'w') {
    text("w", 20, 20);
  }
  if (key == 's') {
    text("s", 20, 40);
  }
  if (key == 'a') {
    text("a", 20, 60);
  }
  if (key == 'd') {
    text("w", 20, 80);
  }
  if (keyCode == UP) {
    text("up", 20, 20);
  }
  if (keyCode == DOWN) {
    text("down", 20, 40);
  }
  if (keyCode == LEFT) {
    testWater.moveL(false);
  }
  if (keyCode == RIGHT) {
    testWater.moveL(false);
    text("left", 20, 60);
  }
}
