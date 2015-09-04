import ketai.sensors.*;

Table earthquakes, delta;

int count;
PImage world;
String src = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.csv";

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
  println(count + " earthquakes found.");
  
  orientation(LANDSCAPE);
  world = loadImage("world.png");
}

void draw() {
  background(127);
  image(world, 0, 0, width, height);
  
  for (int row = 1; row < count; row++) {
    float lon = earthquakes.getFloat(row, 2);
    float lat = earthquakes.getFloat(row, 1);
    float magnitude = earthquakes.getFloat(row, 4);
    float x = map(lon, -180, 180, 0, width);
    float y = map(lat, 85, -60, 0, height);
    noStroke();
    fill(0);
    ellipse(x, y, 5, 5);
    float dimension = map(magnitude, 0, 10, 0, 100);
    float freq = map(millis()%(1000/magnitude),
      0, 1000/magnitude, 0, magnitude*50);
    fill(255, 127, 127, freq);
    ellipse(x, y, dimension, dimension);
    
    Location quake;
    quake = new Location("quake");
    quake.setLongitude(lon);
    quake.setLatitude(lat);
    int distance = int(location.getLocation().distanceTo(quake)/1609.34);
    noFill();
    stroke(150);
    ellipse(myX, myY, dist(x, y, myX, myY)*2, dist(x, y, myX, myY)*2);
    fill(0);
    text(distance, x, y);
  }

  // Current Device location
  noStroke();
  float s = map(millis() % (100*accuracy*3.28), 0, 100*accuracy*3.28, 0, 127);
  fill(127, 255, 127);
  ellipse(myX, myY, 10, 10);
  fill(127, 255, 127, 127-s);
  ellipse(myX, myY, s, s);
}