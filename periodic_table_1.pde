//testing out Processing's Table function

import processing.pdf.*;

int gutterSize = 4;
int barSize = 6;
int moduleSize = 0;
float xCurrent = 0;
float yCurrent = 0;
color elementColor = color(0, 60, 200, 200);
color ancientColor = color(0, 166, 81);
color dupColor = color(227, 31, 38);
color fillColor;
String dup_check;

void setup(){
  size(900, 1200);
  beginRecord(PDF, "periodic-chrono.pdf");
  background(25, 25, 25);
  smooth();
  noStroke();
  textAlign(CENTER);
  
  Table periodicData = loadTable("periodic-chronological.csv", "header");
  int dataRows = periodicData.getRowCount();
  float x_start = 0;
  float y_start = gutterSize;
  
  for (int i = 0; i < dataRows; i++){
    float as_temp = map(periodicData.getFloat(i, 3), 0, dataRows, 0, width - 25);
    String year_temp = periodicData.getString(i, 0);
    String symbol_temp = periodicData.getString(i, 2); 
    float number_temp = periodicData.getFloat(i, 3);
    
    if(year_temp.equals("ancient")){
      fillColor = ancientColor;
    }
    else if(dup_check.equals(year_temp)) {
      fillColor = dupColor;
    }
    else {
      fillColor = elementColor ;
    }
 
    drawElement(x_start, y_start, fillColor, as_temp, symbol_temp, number_temp);
    y_start += barSize + gutterSize;
    println(year_temp);
    dup_check = year_temp;
  }
  
  endRecord();

}

void drawElement(float xloc, float yloc, color fillColor, float atomicSize, String atomic_symbol, float atomic_number){
  fill(fillColor);
  rect(xloc, yloc, atomicSize, barSize);
  pushMatrix();
  translate(atomicSize, yloc);
  fill(#ffffff);
  text(atomic_symbol, 20, 10);
  text(atomic_number, 50, 10);
  popMatrix();  
}

