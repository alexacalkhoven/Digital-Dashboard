class Car 
{
  TripComputer trip_computer;
  FuelTank fuel_tank;
  FuelComputer fuel_computer;
  Direction compass;

  Car ()
  {
    fuel_tank= new FuelTank();
    trip_computer = new TripComputer();
    fuel_computer = new FuelComputer();
    compass = new Direction();
  }

  void processInput (SensorDataProvider sdp)
  {
    trip_computer.findSpeed(sdp.readRPM(), sdp.readRatio());
    trip_computer.findDistance();
    fuel_tank.getConsumedFuel(sdp.readFuelLevel());
    fuel_computer.getfuelEcon(trip_computer.speed, fuel_tank.consumedFuel);
    fuel_computer.updateeconHistory(sdp.currentIndex);
    fuel_computer.getAverageFuelEcon(sdp.currentIndex);
    fuel_computer.getRange(sdp.readFuelLevel());
    fuel_computer.getfuelConsump();
    compass.getDirection(sdp.readX(), sdp.readY());
    fuel_computer.updatefuelConsumpHistory(sdp.currentIndex);
    fuel_computer.updateavfuelEconHistory(sdp.currentIndex);
  }
}
