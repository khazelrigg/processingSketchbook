int gridX = 21;
int gridY = 32;
int gridSize = 20;
color colors[][] = new color[gridX][gridY];

color bgColor = #668baa;
//color bgColor = getRandomColor();
color shirtColor = #f92114;
color skinColor = #fabd14;
color borderColor = #000000;
int stroke = 1;

void setup() {
  strokeWeight(stroke);
  frameRate(60);
  surface.setSize(gridSize * gridX, gridSize * gridY);
  for (int r = 0; r < gridX; r++) {
    for (int c = 0; c < gridY; c++) {
      colors[r][c] = bgColor;
    }
  }

  // Populate colors array with bart's main components
  colorSkin();
  colorEyes();
  colorShirt();
  colorBorder();
}

void draw() {
  drawPupils(mouseX, mouseY);

  for (int r = 0; r < gridX; r++) {
    for (int c = 0; c < gridY; c++) {
      color curColor = colors[r][c];
      fill(curColor);
      rect(r * gridSize, c * gridSize, gridSize, gridSize);
    }
  }
}

void redrawAll() {
  surface.setSize(gridSize * gridX, gridSize * gridY);
  for (int r = 0; r < gridX; r++) {
    for (int c = 0; c < gridY; c++) {
      colors[r][c] = bgColor;
    }
  }
  colorSkin();
  colorEyes();
  colorShirt();
  colorBorder();
}

void blink(boolean add) {
  int[][] blinkFill = { {11, 12, 13, 14, 16, 17, 18, 19}};
  color c;
  if (add) {
    c = skinColor;
  } else {
    c = #ffffff;
  }
  colors = fillColor(blinkFill, c, 12);
}

void mouseWheel(MouseEvent event) {
  float maxStroke = 0.8;
  float e = event.getCount();
  if (stroke + e < 0) {
    stroke = 0;
  } else if (stroke + e > gridSize * maxStroke) {
    stroke = int(gridSize * maxStroke);
  } else {
    stroke += e;
  }
  strokeWeight(stroke);
}

void mousePressed() {
  shrug(true);
  if (mouseButton == LEFT) {
    shirtColor = getRandomColor();
  } else {
    shirtColor = #f92114;
  }
  colorMouth();
  blink(true);
}

void mouseReleased() {
  delay(100);
  shrug(false);
  resetMouth();
  blink(false);
}

void shrug(boolean add) {
  int[][] shoulder = {{1, 2, 3}, {0, 4}, {0, 4}, {0, 4}};
  int[][] sleeve = {{1, 2, 3}};
  if (add) {
    fillColor(shoulder, borderColor, 27);
    fillColor(sleeve, shirtColor, 28);
  } else {
    colors[1][27] = bgColor;
    colors[0][28] = bgColor;
    fillColor(shoulder, borderColor, 28);
    colorShirt();
  }
}

void drawPupils(int x, int y) {
  resetEyes();
  color c = #000000;

  if ( x <= width / 2 && y <= height / 2) {
    colors[17][13] = c;
    colors[12][14] = c;
  }
  if ( x >= width / 2 && y >= height / 2) {
    colors[18][13] = c;
    colors[13][15] = c;
  }
  if ( x >= width / 2 && y <= height / 2) {
    colors[18][13] = c;
    colors[13][14] = c;
  }
  if ( x <= width / 2 && y >= height / 2) {
    colors[17][13] = c;
    colors[12][15] = c;
  }
}

void colorBorder() {
  int[][] borderFill = {
    {10, 12, 14, 15, 16}, {6, 8, 10, 11, 12, 13, 14, 16}, {2, 4, 6, 7, 8, 9, 11, 13, 16}, {0, 2, 3, 4, 5, 7, 9, 16}, {0, 1, 3, 5, 16}, {1, 17}, 
    {1, 17}, {2, 17}, {2, 17}, {3, 17, 18}, {3, 18}, {3, 11, 12, 13, 14, 16, 17, 18, 19}, {3, 10, 15, 20}, {4, 9, 15, 20}, {4, 9, 16, 20}, 
    {4, 9, 16, 17, 18, 19, 20}, {4, 5, 9, 16, 20}, {3, 6, 10, 15, 20}, {3, 5, 11, 12, 13, 14, 17, 18, 19}, {4, 6, 19}, {5, 9, 20}, {5, 8, 9, 10, 20}, 
    {5, 11, 12, 13, 14, 15, 16, 17, 18, 19}, {5, 15}, {5, 13, 14}, {4, 5, 12}, {3, 6, 10, 11, 12}, {2, 7, 8, 9, 13}, {1, 2, 3, 13}, {0, 4, 13, 14}, {0, 4, 14}, {0, 4, 14, 15}
  };
  fillColor( borderFill, borderColor, 0);
}

void colorEyes() {
  int[][] eyeFill = {
    {11, 12, 13, 14, 16, 17, 18, 19}, {10, 11, 12, 13, 14, 16, 17, 18, 19}, {10, 11, 12, 13, 14, 15, 17, 18, 19}, {10, 11, 12, 13, 14, 15, 16}, {10, 11, 12, 13, 14, 15}, {11, 12, 13, 14}
  };
  fillColor( eyeFill, #ffffff, 12);
}

void resetEyes() {
  int[][] eyeFill = {{17, 18}, {12, 13}, {12, 13}};
  fillColor(eyeFill, #ffffff, 13);
}

void colorSkin() {
  //most of head
  for (int row = 3; row < 20; row++) {
    for (int col = 4; col < 17; col++) {
      colors[col][row] = skinColor;
    }
  }
  //Mouth
  for (int row = 20; row < 25; row++) {
    for (int col = 5; col < 15; col++) {
      colors[col][row] = skinColor;
    }
  }

  int[][] skinFill = {
    {15}, {10, 12, 14, 15}, {6}, {2, 4}, {2, 3}, {2, 3}, {3}, {3}, {}, {17}, {}, {}, {}, {}, {}, {17, 18, 19}, {17, 18, 19}, {}, {17, 18}, {15, 16, 17, 18, 19}, {15, 16, 17, 18, 19}, 
    {}, {}, {}, {5, 6, 7, 8, 9, 10, 11}, {7, 8, 9}
  };
  fillColor( skinFill, skinColor, 1);
}

void colorShirt() {
  int[][] shirtFill = {
    {4, 5}, {3, 4, 5, 6, 10, 11, 12}, {4, 5, 6, 7, 8, 9, 10, 11, 12}, {1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12}, {1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13}, {1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13}
  };
  fillColor( shirtFill, shirtColor, 26);
}


int[][] teeth = {{12, 13, 14}, {13, 14}};
int[][] mouth = {{11}, {12, 15}, {12, 13, 14}};

void colorMouth() {
  fillColor(teeth, #f92214, 23);
  fillColor(mouth, borderColor, 23);
}

void resetMouth() {
  fillColor(teeth, skinColor, 23);
  fillColor(mouth, skinColor, 23);
  int[][] bg = {{15, 16}, {13, 14, 15}};
  fillColor(bg, bgColor, 24);
  colorBorder();
}

color[][] fillColor(int[][] pixels, color c, int rowOffset) {
  for (int row = 0; row < pixels.length; row++) {
    for (int col = 0; col < pixels[row].length; col++) {
      colors[pixels[row][col]][row + rowOffset] = c;
    }
  }
  return colors;
}

color getRandomColor() {
  return color(int(random(255)), int(random(255)), int(random(255)));
}

void keyPressed() {
  int maxSize = 1080/gridSize;
  if (key == '=' ) {
    gridSize += 1;
  } else if (key == '-') {
    gridSize -= 1;
  }
  if (gridSize < 2) {
    gridSize = 2;
  } else  if (gridSize > maxSize) {
    gridSize = maxSize + 1;
  }
  surface.setSize(gridSize * gridX, gridSize * gridY);

  if (key =='c' || key == 'C') {
    bgColor = getRandomColor();
    redrawAll();
  }
  if (key == 'z' || key == 'Z') {
    bgColor = #668baa;
    redrawAll();
  }
}
