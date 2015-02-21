// Periodic Remixes by Levi McGranahan
// levimcg.com

// This sketch lists the elements of the periodic table
// in chronological of each element's year of discovery.
// 

import processing.pdf.*;

float gutterSize = 7.5;
float barSize = 3;
int moduleSize = 0;
float xCurrent = 0;
float yCurrent = 0;
color baseColor = color(249, 249, 245);
color elementColor = color(46, 186, 128);
color fillColor;

void setup() {
  size(1000, 1500);
  beginRecord(PDF, "periodic-radial-chronological.pdf");
  background(baseColor);
  smooth();
  noStroke();

  Table periodicData = loadTable("periodic-chronological.csv");
  int dataRows = periodicData.getRowCount();
  float x_start = 0;
  float y_start = gutterSize;
  // Move coordinates to the center
  translate(width/2, height/2);
  for (int i = 0; i < dataRows; i++) {
    float an_temp = map(periodicData.getFloat(i, 0), 0, dataRows, 0, width/2);
    String symbol_temp = periodicData.getString(i, 1); 

    drawElement(8, 0, elementColor, an_temp, symbol_temp);
    y_start += barSize + gutterSize;
    rotate(TWO_PI/dataRows);
  }

  endRecord();
}

void drawElement(float xloc, float yloc, color fillColor, float atomicSize, String atomic_symbol) {
  fill(fillColor);
  rect(xloc, yloc, atomicSize, barSize);
}

