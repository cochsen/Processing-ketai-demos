import ketai.camera.*;
KetaiCamera cam;

void setup() {
  orientation(LANDSCAPE);
  cam = new KetaiCamera(this, 640, 480, 30);
  imageMode(CENTER);
}

void draw() {
  if (cam.isStarted()) {
    image(cam, width/2, height/2);
  }
}

void onCameraPreviewEvent() {
  cam.read();
}

void mousePressed() {
  if (cam.isStarted()) {
    cam.stop();  
  }
  else {
    cam.start();
  }
}