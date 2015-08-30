import ketai.ui.*;
import android.view.MotionEvent;

KetaiGesture gesture;
float rectSize = 100;
float rectAngle = 0;
int x, y;
color c = color(255);
color bg = color(78, 93, 75);

void setup() {
  orientation(LANDSCAPE);              // lock orientation
  gesture = new KetaiGesture(this);    // create new KetaiGesture object
  
  
  textSize(32);                        // set text size
  textAlign(CENTER, BOTTOM);           // set text screen alignment
  rectMode(CENTER);                    // set rectangle draw mode
  noStroke();                          // don't draw a border around the rectangle
  
  x = width/2;                         
  y = height/2;
}

void draw() {
  background(bg);                      // bg set from
  pushMatrix();
  translate(x, y);                     // move across screen
  rotate(rectAngle);                   // rotate rectangle
  fill(c);                             // set fill color
  rect(0, 0, rectSize, rectSize);      // draw rectangle
  popMatrix();
}

// single tap event
void onTap(float x, float y) {          // print event type and location
  text("SINGLE", x, y-10);
  println("SINGLE:" + x + "," + y);
}

// double tap event
void onDoubleTap(float x, float y) {    // print event type and location
  text("DOUBLE", x, y-10);
  println("DOUBLE" + x + "," + y);
  
  if (rectSize > 100)                   // if rectangle size is greater than 100, cap rectangle size at 100
    rectSize = 100;
  else                                  // otherwise
    rectSize = height - 100;            // set rectangle size to height - 100
}

// long finger press event
void onLongPress(float x, float y) {    // print event type and location
  text("LONG", x, y-10);
  println("LONG:" + x + "," + y);  

  c = color(random(255), random(255), random(255));  
}                                      // set rectangle to a random color

// one+ finger flick event
void onFlick(float x, float y, float px, float py, float v) {
  text("FLICK", x, y-10);              // print event type and location
  println("FLICK:" + x + "," + y + "," + v);
  
  bg = color(random(255), random(255), random(255));
}                                      // set rectangle to a random color

// two-finger pinch event
void onPinch(float x, float y, float d) {
  rectSize = constrain(rectSize+d, 10, 500);  
                                       // set lower, upper limits for rectangle size?
  println("PINCH:" + x + "," + y + "," + d);
}                                      // print event type and location

// two-finger rotate event
void onRotate(float x, float y, float angle) {
  rectAngle += angle;                  // set rectangle angle
  println("ROTATE:" + angle);          // print result
}

// finger drag event
void mouseDragged() {
  if (abs(mouseX - x) < rectSize/2 && abs(mouseY - y) < rectSize/2) {
    if(abs(mouseX - pmouseX) < rectSize/2)
      x += mouseX - pmouseX;
    if(abs(mouseY - pmouseY) < rectSize/2)
      y += mouseY - pmouseY;
  }
}

public boolean surfaceTouchEvent(MotionEvent event) {
  // call to keep mouseX and mouseY constants updated
  super.surfaceTouchEvent(event);
  // forward events
  return gesture.surfaceTouchEvent(event);
}