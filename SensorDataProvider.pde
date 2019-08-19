class SensorDataProvider {

  String filePath;
  Table dataTable;
  int currentIndex;
  TableRow row;

  void Initialize(String filePath)
  { 
    dataTable = loadTable (filePath, "header");
    row = dataTable.getRow(currentIndex);
  }

  void readNext()
  {
    int max = (dataTable.getRowCount()-1);

    if (currentIndex < max)
    {
      currentIndex++;
      row = dataTable.getRow(currentIndex);
    } else
    {
      choiceMade = false;
    }
  }

  float readRPM()
  {
    row = dataTable.getRow(currentIndex);
    float RPM = row.getFloat("RPM");
    return (RPM);
  }

  float readFuelLevel()
  {
    row = dataTable.getRow(currentIndex);
    float FL = row.getFloat("Fuel Level (liter)");
    return (FL);
  }

  float readRatio()
  {
    row = dataTable.getRow(currentIndex);
    float GR = row.getFloat("Gear Ratio");
    return (GR);
  }

  float readX()
  {
    row = dataTable.getRow(currentIndex);
    float X = row.getFloat("X");
    return (X);
  }

  float readY()
  {
    row = dataTable.getRow(currentIndex);
    float Y = row.getFloat("Y");
    return (Y);
  }

  void printData()
  {
    println("RPM: " + readRPM(), "Fuel Level: " + readFuelLevel(), "Ratio: " + readRatio(), "X: " + readX(), "Y: " + readY());
  }
}
