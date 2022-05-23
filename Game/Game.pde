<<<<<<< HEAD
void setup() {
  size(800, 800);
  MODE = 2;
  x = width/2;
  y = height/2;
}
void draw() {
  background(255);
  x = change(x);
  y = change(y);
  avatar(x, y);
  if (switchy == false) {
    avatar(mouseX, mouseY);
  } else {
    avatarPoke(mouseX, mouseY);
  }
}
=======
//testing branch kate!!!
>>>>>>> 0c764fead76d3b59b35c48cca1cb5667591663de
