void getChoice ()
{
  if (choiceMade == false)
  {
    background(0);  
    textAlign(LEFT, CENTER);
    PFont menuFont = loadFont("ArialMT-48.vlw");
    textFont(menuFont);
    textSize(40);
    fill(255);
    text("Make choice 1, 2 or 3 \n 1. minicar \n 2. truck \n 3. quit", 1250, 1000);
  }
}
void keyPressed()
{
  {
    if (choiceMade == false) {
      if (key=='1') {
        filePath = "car_status_BMW_323i.csv";
        radius = 0.23;
        tankCapGlob = 60;
        info = new SensorDataProvider();
        car = new Car();
        info.Initialize(filePath);
        choiceMade = true;
        restartProgram = false;
        //contDraw = true;
      } else if (key=='2') {
        filePath = "car_status_Truck_F150.csv";
        radius = 0.254;
        tankCapGlob = 80;
        info = new SensorDataProvider();
        car = new Car();
        info.Initialize(filePath);
        choiceMade = true;
      } else if (key=='3')
        exit();
    }
  }
}
