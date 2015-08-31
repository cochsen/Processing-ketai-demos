package processing.test.geolocation;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ketai.sensors.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Geolocation extends PApplet {


KetaiLocation location;
double longitude, latitude, altitude;
float accuracy;

public void setup() {
  orientation(LANDSCAPE);
  textAlign(CENTER, CENTER);
  textSize(78);
  location = new KetaiLocation(this);
}

public void draw() {
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

public void onLocationEvent(double _latitude, double _longitude,
  double _altitude, float _accuracy) {
    latitude = _latitude;
    altitude = _altitude;
    accuracy = _accuracy;
    println("lat/lon/\naltitude/accuracy: " + latitude + "/" + longitude + "\n"
      + altitude + "/" + accuracy);
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Geolocation" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
