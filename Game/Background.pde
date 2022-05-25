ArrayList <Integer[]> vertLines = new ArrayList<Integer[]>();
ArrayList <Integer[]> horLines = new ArrayList<Integer[]>();

void backdrop() {
  background(#8E874C); //(47,52,17)
  stroke(#272C08);
  fill(#272C08);
  rect(25, 25, 850, 650);
  brick();
}

void brick() {
  stroke(0, 75);
  strokeWeight(2);
  vertLineMaker();
  horLineMaker();
  //line(vertLines.get(0)[0], vertLines.get(0)[1], vertLines.get(0)[2], vertLines.get(0)[3]);
  for (int i = 0; i < horLines.size(); i++) {
    line(horLines.get(i)[0], horLines.get(i)[1], horLines.get(i)[2], horLines.get(i)[3]);
  }
}

void vertLineMaker() {
  int x1 = 75;
  int y1 = 25;
  int x2 = 75;
  int y2 = 50;
  Integer[] brickLine = new Integer[4];
  brickLine[0] = x1;
  brickLine[1] = y1;
  brickLine[2] = x2;
  brickLine[3] = y2;
  vertLines.add(brickLine);
}

void horLineMaker() {
  int x1 = 25;
  int y1 = 50;
  int x2 = 875;
  int y2 = 50;

  while (y1 < 675) {
    Integer[] brickLine = new Integer[4];
    brickLine[0] = x1;
    brickLine[1] = y1;
    brickLine[2] = x2;
    brickLine[3] = y2;

    horLines.add(brickLine);

    y1 += 25;
    y2 += 25;
  }
}
