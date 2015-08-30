import ketai.sensors.*;

KetaiSensor sensor;
float accelerometerX, accelerometerY, accelerometerZ;

void setup() {
  sensor = new KetaiSensor(this);
  sensor.start();
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(48);
}

void draw() {
  background(78, 93, 75);
  // display current accelerometer reading
  text("Accelerometer: \n" +
    "x: " + nfp(accelerometerX, 2, 3) + "\n" +
    "y: " + nfp(accelerometerY, 2, 3) + "\n" +
    "z: " + nfp(accelerometerZ, 2, 3), width/2, height/2);
}

// get device accelerometer readings (m/s^2)
void onAccelerometerEvent(float x, float y, float z) {
  accelerometerX = x;
  accelerometerY = y;
  accelerometerZ = z;
}