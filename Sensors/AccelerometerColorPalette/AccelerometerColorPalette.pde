import ketai.sensors.*;

KetaiSensor sensor;
//float accelerometerX, accelerometerY, accelerometerZ;
PVector accelerometer = new PVector();
PVector pAccelerometer = new PVector();
//float r, g, b;
float ch1, ch2, ch3;
int num = 8;
color[] palette = new color[num];
int paletteIndex = 0;

void setup() 
{
  sensor = new KetaiSensor(this);
  sensor.start();
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(72);
}

void draw() 
{
  // remap sensor values to color range  
  ch1 = map(accelerometer.x, -10, 10, 0, 255);
  ch2 = map(accelerometer.y, -10, 10, 0, 255);
  ch3 = map(accelerometer.z, -10, 10, 0, 255);
  // calculating angle between current and previous accelerometer vector in radians
  float delta = PVector.angleBetween(accelerometer, pAccelerometer);
  if (degrees(delta) > 45) {
    shake();
  }
  
  // assign color to background 
  background(ch1, ch2, ch3);
  fill(0);
  text("Current Color: \n" + 
    "(" + round(ch1) + ", " + round(ch2) + ", " + round(ch3) + ")",
  width*0.5, height*0.25);
  // color picker
  for (int i=0; i<num; i++) {
    fill(palette[i]);
    rect(i*width/num, height/2, width/num, height/2);
  }
  // storing a reference vector
  pAccelerometer.set(accelerometer);
}

void onAccelerometerEvent(float x, float y, float z)
{
  accelerometer.x = x;
  accelerometer.y = y;
  accelerometer.z = z;
}

void mousePressed() 
{
  // updating color value, tapping top half of the screen
  if (mouseY < height/2) {
    palette[paletteIndex] = color(ch1, ch2, ch3);  
    if (paletteIndex < num-1) {
      paletteIndex++;  
    } 
  
    else {
      paletteIndex = 0;  
    }
  }
}

void shake() {
  // resetting all swatches to black
  for (int i=0; i<num; i++) {
    palette[i] = color(0);  
  }
  paletteIndex = 0;
}