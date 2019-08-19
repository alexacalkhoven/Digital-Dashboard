float cumulativeDistance = 0;

class TripComputer
{
  float totalTravelledDistance;
  float speed;

  void findDistance()
  {
    cumulativeDistance += (speed/3600); 
    totalTravelledDistance = cumulativeDistance;
  }

  void findSpeed(float RPM, float gearRatio)
  {
    speed = ((RPM/60)*(1/gearRatio)*2*PI*radius*(3.6));
  }
}
