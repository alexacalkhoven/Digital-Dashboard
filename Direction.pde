class Direction
{
  float prev_x;
  String x;
  float prev_y;
  String y;
  String direction;

  Direction ()
  {
    prev_x = 0;
    prev_y = 0;
  }

  void getDirection(float current_x, float current_y)
  {
    float x_change = prev_x - current_x;
    float y_change = prev_y - current_y;
    if (x_change>0)
      x = "E";
    else if (x_change<0)
      x = "W";
    else if (x_change==0)
      x = "";
    if (y_change>0)
      y = "N";
    else if (y_change<0)
      y = "S";
    else if (y_change==0)
      y = "";

    direction = y+x;

    prev_x = current_x;
    prev_y = current_y;
  }
}
