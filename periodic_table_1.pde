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
  
  Table periodicData = loadTable("periodic-table-alpha.csv");
  int dataRows = periodicData.getRowCount();
  
  float x_start = 0;
  float y_start = 0;
  
  for (int i = 0; i < dataRows; i++){
    
    int drawCount = i;
    float as_temp = map(periodicData.getFloat(i, 0), 0, 300, 0, 700);
    String symbol_temp = periodicData.getString(i, 1); 
    float weight_temp = periodicData.getFloat(i, 0);
    x_start += barSize + gutterSize;
    drawElement(y_start, x_start, elementColor, as_temp, symbol_temp, weight_temp);
    
    println(symbol_temp);
  
  }
  
  endRecord();

}

void drawElement(float xloc, float yloc, color fillColor, float atomicSize, String atomic_symbol, float atomic_weight){
  fill(fillColor);
  rect(xloc, yloc, atomicSize, barSize);
  pushMatrix();
  translate(atomicSize, yloc);
  fill(#ffffff);
  text(atomic_symbol, 20, 10);
  text(atomic_weight, 50, 10);
  popMatrix();  
}

