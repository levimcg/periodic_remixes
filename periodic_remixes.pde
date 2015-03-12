// Periodic Remixes by Levi McGranahan
// levimcg.com

// This sketch lists the elements of the periodic table
// in chronological of each element's year of discovery.
// It starts in the upper left corner and loops through
// each element until it finishes in the bottom left corner.

import processing.pdf.*;

float gutterSize = 6.5;
float barSize = 3;
color baseColor = color(56, 53, 72);
color elementColor = color(0, 185, 111);
color ancientColor = color(255, 255, 255);
color fillColor;

void setup() {
  size(1000, 1500);
  beginRecord(PDF, "periodic-remix-bar-chrono.pdf");
  background(baseColor);
  smooth();
  noStroke();

  Table periodicData = loadTable("periodic-chronological.csv", "header");
  int dataRows = periodicData.getRowCount();
  float x_start = 0;
  float y_start = gutterSize;

  for (int i = 0; i < dataRows; i++) {
    float an_temp = map(periodicData.getFloat(i, 3), 0, dataRows, 0, width - 25);
    String year_temp = periodicData.getString(i, 0); 
    
    //Check to see if the element is "ancient"
    if (year_temp.equals("ancient")) {
      fillColor = ancientColor;
    } else {
      fillColor = elementColor ;
    }

    drawElement(x_start, y_start, fillColor, an_temp);
    y_start += barSize + gutterSize;
  }

  endRecord();
}

// Draw element function
void drawElement(float xloc, float yloc, color fillColor, float atomicNumber) {
  fill(fillColor);
  rect(xloc, yloc, atomicNumber, barSize);
}

