import ketai.sensors.*;
// android.location.Location: A data class representing a geographic location.
import android.location.Location;

KetaiLocation location;
KetaiSensor sensor;
Location destination;
PVector locationVector = new PVector();
float compass;

void setup() {
  destination = new Location("montreal");
  destination.setLatitude(45.501689);
  destination.setLongitude(-73.567256);
  location = new KetaiLocation(this);
  sensor = new KetaiSensor(this);
  sensor.start();
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(72);
  smooth();
}

void draw() {
  background(78, 93, 75);
  float bearing = location.getLocation().bearingTo(destination);
  float distance = location.getLocation().distanceTo(destination);
  if (mousePressed) {
    if (location.getProvider() == "none")
      text("Location data is unavailable. \n" +
        "Please check your location settings.", 0, 0, width, height);
    else
      text("Location:\n" +
        "Latitude: " + locationVector.x + "\n" +
        "Longitude: " + locationVector.y + "\n" +
        "Compass: " + round(compass) + " deg.\n" +
        "Destination:\n" +
        "Bearing: " + bearing + "\n" +
        "Distance: " + distance + " m\n" +
        "Provider: " + location.getProvider(), 20, 0, width, height);
  } 
  else {
    translate(width/2, height/2);
    rotate(radians(bearing) - radians(compass));
    stroke(255);
    triangle(-width/4, 0, width/4, 0, 0, -width/2);
    text((int)distance + " m", 0, 50);
    text(nf(distance*0.000621, 0, 2) + " miles", 0, 100);
  }
}

void onLocationEvent(Location _location) {
  println("onLocation event: " + _location.toString());
  locationVector.x = (float)_location.getLatitude();
  locationVector.y = (float)_location.getLongitude();
}

void onOrientationEvent(float x, float y, float z, long time, int accuracy) {
  compass = x;  
}