// Periodic Remixes by Levi McGranahan
// levimcg.com

// This sketch lists the elements of the periodic table
// radially in chronological of each element's year of discovery.
// It starts at the 12 o'clock position and loops through 360 degrees.

import processing.pdf.*;

float gutterSize = 7.5;
float barSize = 3;
color baseColor = color(56, 53, 72);
color elementColor = color(0, 185, 111);
color ancientColor = color(255, 255, 255);
color fillColor;

void setup() {
  size(1000, 1500);
  beginRecord(PDF, "periodic-remix-polar-chrono.pdf");
  background(baseColor);
  smooth();
  noStroke();

  Table periodicData = loadTable("periodic-chronological.csv", "header");
  int dataRows = periodicData.getRowCount();
  float x_start = 0;
  float y_start = gutterSize;
  // Move coordinates to the center
  translate(width/2, height/2);
  rotate(radians(270));
  for (int i = 0; i < dataRows; i++) {
    float an_temp = map(periodicData.getFloat(i, 3), 0, dataRows, 0, (width - 100)/2);
    String year_temp = periodicData.getString(i, 0);

    if (year_temp.equals("ancient")) {
      fillColor = ancientColor;
    } else {
      fillColor = elementColor;
    } 

    drawElement(70, 0, fillColor, an_temp);
    y_start += barSize + gutterSize;
    rotate(TWO_PI/dataRows);
  }

  endRecord();
}

// Draw element function
void drawElement(float xloc, float yloc, color fillColor, float atomicNumber) {
  fill(fillColor);
  rect(xloc, yloc, atomicNumber, barSize);
}

