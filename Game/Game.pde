void setup() {
  size(1000, 800);
}
void draw() {
  background(255);
  Character test = new Character(width/2, height/2);
  Fireboy testFire = new Fireboy(width / 2 - 100,height/2);
  Watergirl testWater = new Watergirl(width / 2 + 100,height/2);
  test.avatar();
  testFire.avatar();
  testWater.avatar();
}
//testing branch kate!!!
