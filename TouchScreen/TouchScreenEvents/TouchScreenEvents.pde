import ketai.ui.*;
import android.view.MotionEvent;

KetaiGesture gesture;
float rectSize = 100;
float rectAngle = 0;
int x, y, t_height, t_width;
color c = color(255);
color bg = color(78, 93, 75);
String lastEventText = "";

void setup() {
  orientation(LANDSCAPE);
  gesture = new KetaiGesture(this);
  
  
  textSize(64);
  textAlign(CENTER, BOTTOM);
  rectMode(CENTER);
  noStroke();
  
  x = width/2;                
  y = height/2;
  t_height = height/15;
  t_width = width/2;
}

void draw() {
  background(bg);
  pushMatrix();
  translate(x, y);
  rotate(rectAngle);
  fill(c);
  rect(0, 0, rectSize, rectSize);
  popMatrix();
  text(lastEventText, t_width, t_height);
}

// single tap event
void onTap(float x, float y) {
  lastEventText = "SINGLE_TAP@" + x + "," + y;                // print events at top left of screen
  println(lastEventText);
}

// double tap event
void onDoubleTap(float x, float y) {
  lastEventText = "DOUBLE_TAP@" + x + "," + y;
  println(lastEventText);
  
  if (rectSize > 100)      
    rectSize = 100;        // original size on even tap
  else
    rectSize = height - 20;  // big size on odd tap
}

// long finger press event
void onLongPress(float x, float y) {
  lastEventText = "LONG_TAP@" + x + "," + y;
  println(lastEventText);  

  c = color(random(255), random(255), random(255));  
}

// one+ finger flick event
void onFlick(float x, float y, float px, float py, float v) {
  lastEventText = "FLICK from " + x + "," + y + "to " + px + "," + py;
  println(lastEventText);
  
  bg = color(random(255), random(255), random(255));
}

// two-finger pinch event
void onPinch(float x, float y, float d) {
  rectSize = constrain(rectSize+d, 10, 500); 
  lastEventText = "PINCH@" + x + "," + y;
  println(lastEventText);
}

// two-finger rotate event
void onRotate(float x, float y, float angle) {
  rectAngle += angle;
  lastEventText = "ROTATED through angle " + angle;
  println(lastEventText);          
}

// finger drag event
void mouseDragged() {
  if (abs(mouseX - x) < rectSize/2 && abs(mouseY - y) < rectSize/2) {
    if(abs(mouseX - pmouseX) < rectSize/2)
      x += mouseX - pmouseX;
    if(abs(mouseY - pmouseY) < rectSize/2)
      y += mouseY - pmouseY;
  }
  lastEventText = "DRAGGED to " + x + "," + y;
}

public boolean surfaceTouchEvent(MotionEvent event) {
  // call to keep mouseX and mouseY constants updated
  super.surfaceTouchEvent(event);
  // forward events
  return gesture.surfaceTouchEvent(event);
}