Table groceries;

void setup() {
  groceries = loadTable("groceries.tsv");
  textSize(48);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  noStroke();
  noLoop();
  background(0);
  int count = groceries.getRowCount();
  
  for (int row = 1; row < count; row++) {
    float rowHeight = height/count;
    String amount = groceries.getString(row, 0);
    String unit = groceries.getString(row, 1);
    String item = groceries.getString(row, 2);
    
    if (groceries.getString(row, 3).equals("store")) {
      fill(color(255, 110, 50));  
    }
    else if (groceries.getString(row, 3).equals("market")) {
      fill(color(50, 220, 255));  
    }
    else {
      fill(127);
    }
    rect(width/2, rowHeight/2, width, rowHeight);
    fill(255);
    text(amount + " " + unit + " " + item, width/2, rowHeight/2);
    translate(0, rowHeight);
  }
}