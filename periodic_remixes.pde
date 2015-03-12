// Periodic Remixes by Levi McGranahan
// levimcg.com

// This sketch shows the atomic number of each element
// in the periodic table in alphabetical order.

import processing.pdf.*;

float gutterSize = 6.5;
float barSize = 3;
color baseColor = color(56, 53, 72);
color elementColor = color(0, 185, 111);
color fillColor;

void setup() {
  size(1000, 1500);
  beginRecord(PDF, "periodic-remix-bar-alpha.pdf");
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

    drawElement(x_start, y_start, elementColor, an_temp);
    y_start += barSize + gutterSize;
  }

  endRecord();
}

// Function that draws the bars
void drawElement(float xloc, float yloc, color fillColor, float atomicNumber) {
  fill(fillColor);
  rect(xloc, yloc, atomicNumber, barSize);
}
