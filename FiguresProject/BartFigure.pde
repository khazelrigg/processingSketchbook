
class Bart extends Figure {
  color shirtColor = #f92114;
  color skinColor = #fabd14;
  color borderColor = #000000;

  Bart() {  
    gridX = 21;
    gridY = 32;
    fillMap = new color[gridX][gridY];  
}

  void createFillMap() {
    initialFill(#668baa);
    colorSkin();
    colorEyes();
    colorShirt();
    colorBorder();
    drawPupils(mouseX, mouseY);
    blink(blinking);
  }

  void colorSkin() {
    //most of head
    for (int row = 3; row < 20; row++) {
      for (int col = 4; col < 17; col++) {
        fillMap[col][row] = skinColor;
      }
    }
    //Mouth
    for (int row = 20; row < 25; row++) {
      for (int col = 5; col < 15; col++) {
        fillMap[col][row] = skinColor;
      }
    }

    int[][] skinFill = {
      {15}, {10, 12, 14, 15}, {6}, {2, 4}, {2, 3}, {2, 3}, {3}, {3}, {}, {17}, {}, {}, {}, {}, {}, {17, 18, 19}, {17, 18, 19}, {}, {17, 18}, {15, 16, 17, 18, 19}, {15, 16, 17, 18, 19}, 
      {}, {}, {}, {5, 6, 7, 8, 9, 10, 11}, {7, 8, 9}
    };
    fillColor( skinFill, skinColor, 1);
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

  void colorShirt() {
    int[][] shirtFill = {
      {4, 5}, {3, 4, 5, 6, 10, 11, 12}, {4, 5, 6, 7, 8, 9, 10, 11, 12}, {1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12}, {1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13}, {1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13}
    };
    fillColor( shirtFill, shirtColor, 26);
  }

  void colorEyes() {
    int[][] eyeFill = {
      {11, 12, 13, 14, 16, 17, 18, 19}, {10, 11, 12, 13, 14, 16, 17, 18, 19}, {10, 11, 12, 13, 14, 15, 17, 18, 19}, {10, 11, 12, 13, 14, 15, 16}, {10, 11, 12, 13, 14, 15}, {11, 12, 13, 14}
    };
    fillColor( eyeFill, #ffffff, 12);
  }

  void drawPupils(int x, int y) {
    resetEyes();
    color c = #000000;

    if ( x <= width / 2 && y <= height / 2) {
      fillMap[17][13] = c;
      fillMap[12][14] = c;
    }
    if ( x >= width / 2 && y >= height / 2) {
      fillMap[18][13] = c;
      fillMap[13][15] = c;
    }
    if ( x >= width / 2 && y <= height / 2) {
      fillMap[18][13] = c;
      fillMap[13][14] = c;
    }
    if ( x <= width / 2 && y >= height / 2) {
      fillMap[17][13] = c;
      fillMap[12][15] = c;
    }
  }

  
  void blink(boolean add) {
    int[][] blinkFill = { {11, 12, 13, 14, 16, 17, 18, 19}};
    color c = #ffffff;
    if (add) {
      c = skinColor;
      colorMouth();
    }
    fillColor(blinkFill, c, 12);
  }

  void interact() {
    if (mouseButton == LEFT) {
      shirtColor = getRandomColor();
    } else {
      shirtColor = #f92114;
    }
    colorShirt();
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

  void shrug(boolean add) {
    int[][] shoulder = {{1, 2, 3}, {0, 4}, {0, 4}, {0, 4}};
    int[][] sleeve = {{1, 2, 3}};
    if (add) {
      fillColor(shoulder, borderColor, 27);
      fillColor(sleeve, shirtColor, 28);
    } else {
      fillMap[1][27] = bgColor;
      fillMap[0][28] = bgColor;
      fillColor(shoulder, borderColor, 28);
      colorShirt();
    }
  }
  void resetEyes() {
    int[][] eyeFill = {{17, 18}, {12, 13}, {12, 13}};
    fillColor(eyeFill, #ffffff, 13);
  }
  
  
  void showHelp() {
    fill(#ffffff);
    rect(0, 0, gridX * gridSize, gridY * gridSize);
    fill(#000000);
    textSize(32);
    text("Help:", 10, 30);

    textSize(20);
    String[] textLines = {
      "Space : Next Figure",
      "= : Enlarge size of grid by 1", 
      "- : Decrease size of grid by 1", 
      "c : Randomly change color of background", 
      "z : reset background", 
      "s : Randomly change color of shirt", 
      "LMouse : Interact and change shirt", 
      "RMouse: Interact and reset shirt", 
      "? : Toggle this help page", };

    for (int i = 0; i < textLines.length; i++) {
      text(textLines[i], 10, 60 + 30*i);
    }
  }
  
}
