int x,y;

void avatar(int x, int y) {
  //your code here
  noStroke();
  fill(97, 173, 106);
  circle(x, y, 75);
  circle(x - 25, y - 37, 35);
  circle(x + 25, y - 37, 35);
  fill(219, 194, 156);
  circle(x, y, 55);
  fill(224, 218, 218);
  circle(x - 25, y - 37, 15);
  circle(x + 25, y - 37, 15);
  fill(0, 0, 0);
  circle(x - 25, y - 37, 10);
  circle(x + 25, y - 37, 10);
  rect(x + 8, y - 10, 12, 5);
  rect(x - 20, y - 10, 12, 5);
  rect(x - 20, y - 10, 12, 5);
  fill(242, 116, 116);
  stroke(1);
  ellipse(x, y + 15, 16, 5);
  noStroke();
  ellipse(x + 4, y + 17, 4, 8);
  fill(128, 215, 232);
  arc(x, y, 80, 80, 0, QUARTER_PI /2);
  ellipse(x + 45, y + 5, 40, 20);
}
