import android.os.Environment;

Table csv;
ArrayList<PVector> points = new ArrayList<PVector>();
void setup() {
  orientation(LANDSCAPE);
  noStroke();
  textSize(48);
  textAlign(CENTER);
  try {
    csv = new Table(new File(sketchPath("") + "data.csv"));
  }
  catch (Exception e) {
    csv = new Table();  
  }
  for (int row = 1; row < csv.getRowCount(); row++) {
    points.add(new PVector(csv.getInt(row, 0), csv.getInt(row, 1), 0));  
  }
}

void draw() {
  background(78, 93, 75);
  for (int i = 0; i < points.size(); i++) {
    ellipse(points.get(i).x, points.get(i).y, 5, 5);
  }
  text("Number of points: " + points.size(), width/2, 50);
}

void mouseDragged() {
  points.add(new PVector(mouseX, mouseY));
  String[] data = {
    Integer.toString(mouseX), Integer.toString(mouseY)  
  };
  csv.addRow();
  csv.setRow(csv.getRowCount()-1, data);
}

void keyPressed() {
  try {
    csv.save(new File(Environment.getExternalStorageDirectory().getAbsolutePath() + "/data.csv"), "csv");
  }
  catch(IOException iox) {
    println("Failed to write file." + iox.getMessage());  
  }
}