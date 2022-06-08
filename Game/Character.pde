public class Character {
  float x, y;
  float dy = 0;
  boolean isOnPlat = false, isOnBox = false;
  boolean win;
  boolean faceR;
  int halfWide = 15;
  int tall = 43;

  Character (float x, float y) {
    this.x = x;
    this.y = y;
    faceR = true;
  }

  void avatar() {
    rectMode(CORNERS);
    //legs
    rect(x-15, y-25, x-2, y, 0, 0, 3, 3);
    rect(x+15, y-25, x+2, y, 0, 0, 3, 3);
    
    //body
    rect(x-15, y-25, x+15, y-7);
    
    //head
    circle(x, y - 28, 30);
    
    if (faceR) {
      // backpack
      rect(x - 21, y - 28, x - 5, y - 8, 4, 0, 0, 4);
      
      //eyes
      stroke(0, 130);
      fill(60, 95, 110);
      strokeWeight(2);
      rect(x-2, y-21, x+19, y - 32, 4, 4, 4, 4);
      noStroke();
    } else {
      // backpack
      rect(x + 21, y - 28, x + 5, y - 8, 4, 4, 4, 4);
      
      //eyes
      stroke(0, 130);
      fill(60, 95, 110);
      strokeWeight(2);
      rect(x+2, y-21, x-19, y - 32, 4, 4, 4, 4);
      noStroke();
    }
  }

  boolean detectBordersL(ArrayList<Platform> plats, Box box) {
    for (Platform p : plats) {
      if((p.x2 >= (x - 15) && p.x1 <= x) && (p.y1 < y && p.y2 > y)) {
        println("A");
        return false;
      }
      else if((p.x1 <= (x + 15) && p.x2 >= x) && (p.y1 < y && p.y2 > y)) {
        return false;
      }
    }
    if((box.x2 >= (x - 42) && box.x1 <= x) && (box.y1 < y && box.y2 > y)) {
        println("A");
        return false;
      }
    if (x <= 42) 
      return false;
    else {
      return true;
    }
  }
  boolean detectBordersR() {
    if (x >= width - 42) 
      return false;
    else
      return true;
  }
  
}
