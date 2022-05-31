class Controller {
  static final int FIRE_LEFT = 0;
  static final int FIRE_RIGHT = 1;
  static final int FIRE_UP = 2;
  static final int WATER_LEFT = 3;
  static final int WATER_RIGHT = 4;
  static final int WATER_UP = 5;

  boolean [] inputs;

  public Controller() {
    inputs = new boolean[6];//6 valid buttons
  }

  /**@param code: a valid constant e.g. FIRE_LEFT
   */
  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    if (code == 'A')
      inputs[FIRE_LEFT] = true;
    if (code == 'D')
      inputs[FIRE_RIGHT] = true;
    if (code == 'W')
      inputs[FIRE_UP] = true;
    if (code == 'J')
      inputs[WATER_LEFT] = true;
    if (code == 'L')
      inputs[WATER_RIGHT] = true;
    if (code == 'I')
      inputs[WATER_UP] = true;
  }
  void release(int code) {
    if (code == 'A')
      inputs[FIRE_LEFT] = false;
    if (code == 'D')
      inputs[FIRE_RIGHT] = false;
      if (code == 'J')
      inputs[WATER_LEFT] = false;
    if (code == 'L')
      inputs[WATER_RIGHT] = false;
    if (code == 'W')
      inputs[FIRE_UP] = false;
    if (code == 'I')
      inputs[WATER_UP] = false;
  }
}
