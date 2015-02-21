// Periodic Remixes by Levi McGranahan
// levimcg.com

// This sketch lists the elements of the periodic table
// in chronological of each element's year of discovery.
// 

import processing.pdf.*;

float gutterSize = 6.5;
float barSize = 3;
int moduleSize = 0;
float xCurrent = 0;
float yCurrent = 0;
color baseColor = color(240, 90, 63);
color elementColor = color(190, 63, 52);
color fillColor;

void setup() {
  size(1000, 1500);
  beginRecord(PDF, "periodic-alpha.pdf");
  background(baseColor);
  smooth();
  noStroke();
  textAlign(CENTER);

  Table periodicData = loadTable("periodic-table-alpha.csv");
  int dataRows = periodicData.getRowCount();
  float x_start = 0;
  float y_start = gutterSize;

  for (int i = 0; i < dataRows; i++) {
    float an_temp = map(periodicData.getFloat(i, 0), 0, dataRows, 0, width - 25);
    String symbol_temp = periodicData.getString(i, 1); 

    drawElement(x_start, y_start, elementColor, an_temp, symbol_temp);
    y_start += barSize + gutterSize;
  }

  endRecord();
}

void drawElement(float xloc, float yloc, color fillColor, float atomicSize, String atomic_symbol) {
  fill(fillColor);
  rect(xloc, yloc, atomicSize, barSize);
}

