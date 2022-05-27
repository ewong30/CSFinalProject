class Controller {
  static final int P1_LEFT = 0;
  static final int P1_RIGHT = 1;
  static final int P2_LEFT = 2;
  static final int P2_RIGHT = 3;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[4];//2 valid buttons
  }

  /**@param code: a valid constant e.g. P1_LEFT
   */
  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    println(code);
    if (code == 'A')
      inputs[P1_LEFT] = true;
    if (code == 'D')
      inputs[P1_RIGHT] = true;
    if (code == 'J')
      inputs[P2_LEFT] = true;
    if (code == 'L')
      inputs[P2_RIGHT] = true;
  }
  void release(int code) {
    if (code == 'A')
      inputs[P1_LEFT] = false;
    if (code == 'D')
      inputs[P1_RIGHT] = false;
      if (code == 'J')
      inputs[P2_LEFT] = false;
    if (code == 'L')
      inputs[P2_RIGHT] = false;
  }
}
