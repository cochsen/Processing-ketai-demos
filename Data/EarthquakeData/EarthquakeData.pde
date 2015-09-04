import ketai.sensors.*;

Table earthquakes, delta;

int count;
PImage world;
String src = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.csv";
KetaiLocation location;

void setup() {
  location = new KetaiLocation(this);
  try {
    earthquakes = loadTable(src);  
  }
  catch (Exception x) {
    println("Failed to open online stream reverting to local data");
    earthquakes = loadTable("2.5_day.csv");
  }
  count = earthquakes.getRowCount();
  
  orientation(LANDSCAPE);
  world = loadImage("world.png");
  
  for (int row = 1; row < count; row++) {
    float lon = earthquakes.getFloat(row, 3);
    float lat = earthquakes.getFloat(row, 2);
    float magnitude = earthquakes.getFloat(row, 5);
    println("lon: " + lon + ", " + "lat: " + lat + ", " + "magnitude: " + magnitude); 
  }
}