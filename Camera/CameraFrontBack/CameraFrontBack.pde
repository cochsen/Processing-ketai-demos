import ketai.camera.*;

KetaiCamera cam;

void setup() {
  orientation(LANDSCAPE);
  cam = new KetaiCamera(this, 1280, 960, 30);
  println(cam.list());
  cam.setCameraID(0);
  imageMode(CENTER);
  stroke(255);
  textSize(72);
}

void draw() {
  // show live camera feed
  image(cam, width/2, height/2);
  // draw buttons
  drawUI();
}