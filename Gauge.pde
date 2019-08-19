class Gauge 
{
  String type;
  float minimum;
  float maximum;
  float bottom15;
  float top15;
  float current_val;
  String units;
  int x_pos;
  int y_pos;
  float colour;
  int dec;

  Gauge (int x, int y)
  {
    x_pos = x;
    y_pos = y;
  }

  Gauge (String typesent, float current, String unitssent, int x, int y)
  {
    type = typesent;
    minimum = 0;
    maximum = getMax(typesent);
    bottom15 = (0.15*maximum);
    top15 = (maximum - bottom15);
    current_val = current; //round?
    units = unitssent;
    x_pos = x;
    y_pos = y;
  }

  float getMax(String type)
  {
    if (type.equals("speed"))
      return 260;
    if (type.equals("RPM"))
      return 6;
    if (type.equals("Fuel"))
      return 80; //put fuel capacity here based on choice
    return 0;
  }

  void drawFuelGauge (float maxFuel, float curFuel)
  {
    //add tank symbol
    fill(200);
    stroke(200);
    rect(x_pos+430, y_pos-350, 40, 60);
    fill(0);
    stroke(0);
    rect(x_pos+435, y_pos-345, 30, 20);
    fill(255);
    textSize(35);
    text ("FULL", x_pos+550, y_pos-250);
    text("HALF", x_pos+550, y_pos);
    fill(255, 0, 0);
    text("EMPTY", x_pos+555, y_pos+250);
    stroke(200);
    fill(200);
    rect(x_pos+400, y_pos-250, 100, 500);

    if (info.currentIndex>1)
    {
      if (curFuel<=(maxFuel/4)) {
        fill(255, 0, 0);
        stroke(255, 0, 0);
      } else if (curFuel<=(maxFuel/2)) {
        fill(#FCBB05);
        stroke(#FCBB05);
      } else {
        fill (0, 255, 0);
        stroke (0, 255, 0);
      }

      quad(x_pos+410, (y_pos-240)+(480 - ((480/maxFuel)*curFuel)), x_pos+490, (y_pos-240)+(480 - ((480/maxFuel)*curFuel)), x_pos+490, y_pos+240, x_pos+410, y_pos+240);
    }
  }

  void drawCompass(String direc)
  {

    stroke(255);
    strokeWeight(5);
    if (direc.equals("N"))
      line(x_pos, y_pos, x_pos, y_pos-75);
    if (direc.equals("NE"))
      line(x_pos, y_pos, x_pos+(75/sqrt(2)), y_pos-(75/sqrt(2)));
    if (direc.equals("E"))
      line(x_pos, y_pos, x_pos+75, y_pos);
    if (direc.equals("SE"))
      line(x_pos, y_pos, x_pos+(75/sqrt(2)), y_pos+(75/sqrt(2)));
    if (direc.equals("S"))
      line(x_pos, y_pos, x_pos, y_pos+75);
    if (direc.equals("SW"))
      line(x_pos, y_pos, x_pos-(75/sqrt(2)), y_pos+(75/sqrt(2)));
    if (direc.equals("W"))
      line(x_pos, y_pos, x_pos-75, y_pos);
    if (direc.equals("NW"))
      line(x_pos, y_pos, x_pos-(75/sqrt(2)), y_pos-(75/sqrt(2)));

    stroke(255);
    strokeWeight(5);
    noFill();
    ellipse(x_pos, y_pos, 150, 150);
    textFont(digitalFont);
    textSize(70);
    textAlign(CENTER, CENTER);
    fill(0, 255, 0);
    text(direc, x_pos, y_pos);
  }

  void drawGauge ()
  {
    textFont(digitalFont);
    textAlign(CENTER, CENTER);
    if (current_val<maximum && current_val>minimum)
    {
      if ((current_val>=top15 || current_val<=bottom15))  //is this working?
      {
        fill (255, 0, 0);
      } else 
      {
        fill (255);
      }
      textSize(80);
      if(type.equals("RPM"))
      dec = 3;
      else
      dec = 2;
      text(nfc(current_val, dec), x_pos, y_pos);
    } else
      text("out of range", x_pos, y_pos);

    stroke(255);
    strokeWeight(15);
    noFill();
    ellipse (x_pos, y_pos, 600, 600);
    textSize(60);
    fill(255);
    text(units, x_pos+80, y_pos+350);
    text(type, x_pos-80, y_pos+350);
  }

  void drawText ()
  {
    String title = "";
    if (type.equals("totalDistanceTravelled"))
      title = "ODOMETER: ";
    if (type.equals("fuelEcon"))
      title = "FUEL ECONOMY: ";
    if (type.equals("range"))
      title = "RANGE: ";
    if (type.equals("avFuelConsump"))
      title = "FUEL CONSUMPTION: ";

    textFont(digitalFont);
    textAlign(LEFT);
    fill (0, 255, 0);
    textSize(45);
    text(title + nfc(current_val, 2) + "  " + units, x_pos+100, y_pos);
  }
}
