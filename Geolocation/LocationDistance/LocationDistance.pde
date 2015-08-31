import ketai.sensors.*;
double longitude, latitude, altitude, accuracy;
KetaiLocation location;
Location uic;

void setup() {
  location = new KetaiLocation(this);
  // Example location: the University of Illinois at Chicago Art Building
  uic = new Location("uic");
  uic.setLatitude(41.874698);
  uic.setLongitude(-87.658777);
  orientation(LANDSCAPE);
  textAlign(CENTER, CENTER);
  textSize(72);
}

void draw() {
  background(78, 93, 75);
  if (location.getProvider() == "none") {
    text("Location data is unavailable. \n" +
      "Please check your location settings.", 0, 0, width, height);
  } else {
    float distance = round(location.getLocation().distanceTo(uic));
    text("Location: data:\n" +
      "Latitude: " + latitude + "\n" +
      "Longitude: " + longitude + "\n" +
      "Altitude: " + altitude + "\n" +
      "Accuracy: " + accuracy + "\n" +
      "Distance to Destination: " + distance + "m\n" +
      "Provider: " + location.getProvider(), 20, 0, width, height);
  }
}

void onLocationEvent(Location _location) {
  //print out the location object
  println("onLocation event: " + _location.toString());
  longitude = _location.getLongitude();
  latitude = _location.getLatitude();
  altitude = _location.getAltitude();
  accuracy = _location.getAccuracy();
}