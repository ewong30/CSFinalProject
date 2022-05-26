void setup() {
  size(900, 700);
  backdrop();
}


void draw() {
  
  Character test = new Character(width/2, height/2);
  Fireboy testFire = new Fireboy(75, 675);
  Watergirl testWater = new Watergirl(width / 2 + 100, height/2);
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
    text("up", 20, 20);
  }
  if (keyCode == DOWN) {
    text("down", 20, 40);
  }
  if (keyCode == LEFT) {
    text("left", 20, 60);
  }
  if (keyCode == RIGHT) {
    text("right", 20, 80);
  }
}
