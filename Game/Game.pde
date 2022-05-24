void setup() {
  size(800, 800);
  x = width/2;
  y = height/2;
}
void draw() {
  background(255);
  avatar(x, y);
}
//testing branch kate!!!

//movement:
void keyPressed() {
  if(key == 'w') {
    text("w", 20, 20);
  }
  if(key == 's') {
    text("s", 20, 40);
  }
  if(key == 'a') {
    text("a", 20, 60);
  }
  if(key == 'd') {
    text("w", 20, 80);
  }
  if(keyCode == UP) {
    text("up", 20, 20);
  }
  if(keyCode == DOWN) {
    text("down", 20, 40);
  }
  if(keyCode == LEFT) {
    text("left", 20, 60);
  }
  if(keyCode == RIGHT) {
    text("right", 20, 80);
  }
  
}
