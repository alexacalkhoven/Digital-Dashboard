class FuelTank
{
  float tankCap;
  float consumedFuel;
  float currentfuelLevel;
  float previousfuelLevel;

  FuelTank()
  {
    tankCap = tankCapGlob;
  }

  void getConsumedFuel(float fuelLevel)
  {
    if (info.currentIndex == 0)
    {
      previousfuelLevel = fuelLevel; //assume to start at 50 or 80?
      consumedFuel = previousfuelLevel - fuelLevel;
    } else
    {
      currentfuelLevel = fuelLevel;
      consumedFuel = previousfuelLevel - currentfuelLevel;
      previousfuelLevel = fuelLevel;
    }
  }
}
