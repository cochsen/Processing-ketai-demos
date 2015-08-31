import ketai.sensors.*;
KetaiLocation location;
double longitude, latitude, altitude;
float accuracy;

void setup() {
  orientation(LANDSCAPE);
  textAlign(CENTER, CENTER);
  textSize(78);
  location = new KetaiLocation(this);
}

void draw() {
  background(78, 93, 75);
  if (location.getProvider() == "none")
    text("Location data is unavailable. \n" +
      "Please check your location settings.", width/2, height/2);
  else
    text("Latitude: " + latitude + "\n" +
      "Longitude: " + longitude + "\n" +
      "Altitude: " + altitude + "\n" +
      "Accuracy: " + accuracy + "\n" +
      "Provider: " + location.getProvider(), width/2, height/2);
}

void onLocationEvent(double _latitude, double _longitude,
  double _altitude, float _accuracy) {
    latitude = _latitude;
    longitude = _longitude;
    altitude = _altitude;
    accuracy = _accuracy;
    println("lat/lon/\naltitude/accuracy: " + latitude + "/" + longitude + "\n"
      + altitude + "/" + accuracy);
  }