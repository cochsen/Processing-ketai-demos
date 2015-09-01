void drawUI() {
  fill(0, 128);
  // button 1
  rect(0, 0, width/4, 160);
  // button 2
  rect(width/4, 0, width/4, 160);
  // button 3
  rect(2*(width/4), 0, width/4, 160);
  // button 4 (empty)
  rect(3*(width/4), 0, width/4, 160);
  fill(255);
  // button label 1 (start/stop)
  if (cam.isStarted())
    text("stop", 20, 80);
  else
    text("start", 20, 80);
  // button label 2 (camera)
  text("camera", (width/4)+20, 80);
  // button label 3
  text("flash", 2*(width/4)+20, 80);
}

// detect presses in button areas
void mousePressed() {
  if (mouseY <= 80) {
    if (mouseX > 0 && mouseX < width/4) {
      if (cam.isStarted()) {
        cam.stop();  
      }
      else {
        if (!cam.start())
          println("Failed to start camera.");
      }
    }
    else if (mouseX > width/4 && mouseX < 2*(width/4)) {
        int cameraID = 0;
        if (cam.getCameraID() == 0)
          cameraID = 1;
        else
          cameraID = 0;
        cam.stop();
        cam.setCameraID(cameraID);
        cam.start();
    }
    else if (mouseX > 2*(width/4) && mouseX < 3*(width/4)) {
        if (cam.isFlashEnabled())
          cam.disableFlash();
        else
          cam.enableFlash();
    }
  }
}

void onCameraPreviewEvent() {
  cam.read();  
}

// stop camera activity on exit
void exit() {
  cam.stop();  
}