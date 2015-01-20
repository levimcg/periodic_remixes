//testing out Processing's Table function

import processing.pdf.*;

int gutterSize = 4;
int barSize = 8;
int moduleSize = 0;
float xCurrent = 0;
float yCurrent = 0;
color elementColor = color(0, 60, 200, 200);

void setup(){
  size(900, 1200);
  beginRecord(PDF, "periodic.pdf");
  background(25, 25, 25);
  smooth();
  noStroke();
  textAlign(CENTER);
  
  Table periodicData = loadTable("periodic-table-split.csv");
  int dataRows = periodicData.getRowCount();
  
  float x_start = 0;
  float y_start = 0;
  
  for (int i = 0; i < dataRows; i++){
    
    int drawCount = i;
    float as_temp = map(periodicData.getFloat(i, 1), 0, 300, 0, 400);
    x_start += barSize + gutterSize;
    drawElement(y_start, x_start, elementColor, as_temp);
    
    println(periodicData.getString(i,2));
  
  }
  
  endRecord();

}

void drawElement(float xloc, float yloc, color fillColor, float atomicSize){
  fill(fillColor);
  rect(xloc, yloc, atomicSize, barSize);  
}

