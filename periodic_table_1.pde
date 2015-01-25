// Periodic Remixes by Levi McGranahan
// levimcg.com

// This sketch lists the elements of the periodic table
// in chronological of each element's year of discovery.
// 

import processing.pdf.*;

float gutterSize = 7.5;
float barSize = 5;
int moduleSize = 0;
float xCurrent = 0;
float yCurrent = 0;
color baseColor = color(240, 90, 63);
color elementColor = color(190, 63, 52);
color ancientColor = color(236, 152, 141);
color dupColor = color(163, 52, 46);
color fillColor;
String dup_check;

void setup() {
  size(1000, 1500);
  beginRecord(PDF, "periodic-chrono.pdf");
  background(baseColor);
  smooth();
  noStroke();
  textAlign(CENTER);

  Table periodicData = loadTable("periodic-chronological.csv", "header");
  int dataRows = periodicData.getRowCount();
  float x_start = 0;
  float y_start = gutterSize;

  for (int i = 0; i < dataRows; i++) {
    float an_temp = map(periodicData.getFloat(i, 3), 0, dataRows, 0, width - 25);
    String year_temp = periodicData.getString(i, 0);
    String symbol_temp = periodicData.getString(i, 2); 
    float number_temp = periodicData.getFloat(i, 3);

    if (year_temp.equals("ancient")) {
      fillColor = ancientColor;
    } else if (year_temp.equals(dup_check)) {
      fillColor = dupColor;
    } else {
      fillColor = elementColor ;
    }

    drawElement(x_start, y_start, fillColor, an_temp, symbol_temp, number_temp);
    y_start += barSize + gutterSize;
    dup_check = year_temp;
  }

  endRecord();
}

void drawElement(float xloc, float yloc, color fillColor, float atomicSize, String atomic_symbol, float atomic_number) {
  fill(fillColor);
  rect(xloc, yloc, atomicSize, barSize);
  //  pushMatrix();
  //  translate(atomicSize, yloc);
  //  fill(#ffffff);
  //  text(atomic_symbol, 20, 10);
  //  text(atomic_number, 50, 10);
  //  popMatrix();
}

