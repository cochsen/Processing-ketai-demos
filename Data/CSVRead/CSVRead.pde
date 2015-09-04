Table colors;

void setup() {
  colors = loadTable("colors.csv");
  
  textSize(48);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  noStroke();
  noLoop();
  int count = colors.getRowCount();
  
  for (int row = 0; row < count; row++) {
    color c = unhex("FF" + colors.getString(row, 1).substring(1));
    float swatchHeight = height/count;
    fill(c);
    rect(width/2, swatchHeight/2, width, swatchHeight);
    fill(255);
    text(colors.getString(row, 0), width/2, swatchHeight/2);
    translate(0, swatchHeight);
  }
}