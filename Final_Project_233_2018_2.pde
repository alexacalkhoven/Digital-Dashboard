SensorDataProvider info;
String filePath = "";
Car car;
float radius;
float tankCapGlob;  
boolean contDraw = true;
PFont digitalFont;
import org.gicentre.utils.stat.*;
boolean choiceMade = false;
boolean restartProgram = false;
boolean playSound = true;
boolean playelectronicSound = false;
boolean playjazzSound = false;
boolean playpopSound = false;
boolean songPlaying = false;

Minim minim;
AudioPlayer carsound;
AudioPlayer electronicsound;
AudioPlayer jazzsound;
AudioPlayer popsound;

void setup ()
{
  size (3000, 2000);
  digitalFont = createFont("digital-7.ttf", 20);
  import ddf.minim.*;
  minim = new Minim(this);
  frameRate(60);
}

void draw()
{
  if (choiceMade == false)
  {
    getChoice();
  }
  if (choiceMade == true)
  {
    if (playSound)
    {
      carsound = minim.loadFile("car.mp3", 512);
      carsound.play();
      playSound = false;
    }
    background(0);
    drawRadio();
    textSize(25);
    fill(150);
    text(filePath, 2850, 1975);
    car.processInput(info);
    //info.printData();
    info.readNext(); 
    Gauge speed = new Gauge("speed", car.trip_computer.speed, "(KM/H)", 750, 500);
    Gauge RPM = new Gauge ("RPM", info.readRPM()/1000, "X 1000", 1500, 500);
    Gauge fuel = new Gauge ("Fuel", info.readFuelLevel(), "(LITER)", 2250, 500);
    Gauge distance = new Gauge ("totalDistanceTravelled", car.trip_computer.totalTravelledDistance, "KM", 500, 1000);
    Gauge fuelecon = new Gauge ("fuelEcon", car.fuel_computer.fuelEcon, "KM/LITER", 500, 1050);
    Gauge range = new Gauge ("range", car.fuel_computer.range, "KM", 1500, 1000);
    Gauge afc = new Gauge ("avFuelConsump", car.fuel_computer.fuelConsump, "LITER/(100KM)", 1500, 1050);
    Gauge comp = new Gauge (1500, 100);
    speed.drawGauge();
    RPM.drawGauge();
    fuel.drawGauge();
    fuel.drawFuelGauge(tankCapGlob, car.fuel_tank.currentfuelLevel);
    distance.drawText();
    fuelecon.drawText();
    range.drawText();
    afc.drawText();
    comp.drawCompass(car.compass.direction);
    drawChart(500, 1150, car.fuel_computer.avfuelEconHistory, "Average Fuel Economy (km/liter) over time (sec)");
    drawChart(1500, 1150, car.fuel_computer.fuelConsumpHistory, "Fuel Consumption (liter) over time(sec)");
    if (info.currentIndex==599)
    {
      carsound.pause();
      playSound = true;
      if (playpopSound)
        popsound.pause();
      if (playjazzSound)
        jazzsound.pause();
      if (playelectronicSound)
        electronicsound.pause();
      songPlaying = false;
    }
  }
}
