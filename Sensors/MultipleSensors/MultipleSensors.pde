import ketai.sensors.*;
KetaiSensor sensor;

PVector magneticField, accelerometer, gyroscope;
float light, proximity;

void setup() {
  sensor = new KetaiSensor(this);
  sensor.start();
  sensor.list();
  accelerometer = new PVector();
  magneticField = new PVector();
  gyroscope = new PVector();
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(48);
}

void draw() {
    background(78, 93, 75);
    text("Accelerometer :" + "\n"
      + "x: " + nfp(accelerometer.x, 1, 2) + "\n"
      + "y: " + nfp(accelerometer.y, 1, 2) + "\n"
      + "z: " + nfp(accelerometer.z, 1, 2) + "\n"
      + "MagneticField :" + "\n"
      + "x: " + nfp(magneticField.x, 1, 2) + "\n"
      + "y: " + nfp(magneticField.y, 1, 2) + "\n"
      + "z: " + nfp(magneticField.z, 1, 2) + "\n"
      + "Gyroscope :" + "\n"
      + "x: " + nfp(gyroscope.x, 1, 2) + "\n"
      + "y: " + nfp(gyroscope.y, 1, 2) + "\n"
      + "z: " + nfp(gyroscope.z, 1, 2) + "\n"      
      + "Light Sensor : " + light + "\n"
      + "Proximity Sensor : " + proximity + "\n"
      , 20, 0, width, height);
}

void onAccelerometerEvent(float x, float y, float z, long time, int accuracy) {
  accelerometer.set(x, y, z);
}

void onMagneticFieldEvent(float x, float y, float z, long time, int accuracy) {
  magneticField.set(x, y, z);
}

void onGyroscopeEvent(float x, float y, float z) {
  gyroscope.set(x, y, z);  
}

void onLightEvent(float v) {
  light = v;  
}

void onProximityEvent(float v) {
  proximity = v;  
}

public void mousePressed() {
  if (sensor.isStarted())
    sensor.stop();
  else
    sensor.start();
  println("KetaiSensor isStarted: " + sensor.isStarted());
}