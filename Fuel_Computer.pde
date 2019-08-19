class FuelComputer
{
  float fuelEcon;
  float prevfuelEcon;
  float avfuelEcon;
  float fuelConsump;
  float [] fuelConsumpHistory;
  float [] FCHtemp;
  float [] avfuelEconHistory;
  float [] AFEHtemp;
  float [] econHistory;
  float range;
  int start;
  int end;
  float totalfuelEcon;

  FuelComputer ()
  {
    econHistory = new float [600]; //add in table row count?
    fuelConsumpHistory = new float [40];
    FCHtemp = new float [40];
    avfuelEconHistory = new float [40];
    AFEHtemp = new float [40];
    start = 0;
    end = 60;
  }

  void getfuelConsump()
  {
    fuelConsump = (1/avfuelEcon)*100;
  }

  void getfuelEcon(float speed, float fuel)
  {
    float distance = speed/3600; //?? how to avoid infinity?
    if (fuel == 0)
    {
      fuelEcon = prevfuelEcon;
    } else
    {
      fuelEcon = distance/fuel;
      prevfuelEcon = fuelEcon;
    }
  }

  void updateeconHistory(int index)
  {
    econHistory[index] = fuelEcon;
  }

  void getAverageFuelEcon (int index)
  {
    totalfuelEcon = 0;
    if (index<60)
    {
      for (int i = 0; i<60; i++)
      {
        totalfuelEcon += econHistory[i];
      }
      avfuelEcon = totalfuelEcon/(index+1);
    } else
    {
      for (int i = start; i<end; i++)
      {
        totalfuelEcon += econHistory[i];
      }
      avfuelEcon = totalfuelEcon/60;
      start++;
      end++;
    }
  }

  void printeconHistory(int index)
  {
    println("econ history is:");
    for (int i = index; i>0; i--)
      print(econHistory [i], ", ");
  }

  void getRange(float RemainingFuel)
  {
    range = avfuelEcon * RemainingFuel;
  }

  //GRAPH INFO//
  void updateavfuelEconHistory (int index)
  {
    if (index < 40)
    {
      avfuelEconHistory[index] = avfuelEcon;
    } else
    {
      for (int i = 0; i<39; i++)
      {
        AFEHtemp[i] = avfuelEconHistory[i+1];
      }

      AFEHtemp [39] = avfuelEcon;
      avfuelEconHistory = AFEHtemp;
    }
  }

  void updatefuelConsumpHistory (int index)
  {
    if (index < 40)
    {
      fuelConsumpHistory[index] = fuelConsump;
    } else
    {
      for (int i = 0; i<39; i++)
      {
        FCHtemp[i] = fuelConsumpHistory[i+1];
      }

      FCHtemp [39] = fuelConsump;
      fuelConsumpHistory = FCHtemp;
    }
  }
  //GRAPH INFO//
}
