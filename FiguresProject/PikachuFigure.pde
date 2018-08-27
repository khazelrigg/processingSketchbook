class Pikachu extends Figure {
  boolean earToggle = false;

  Pikachu() {
    gridX =19;
    gridY = 21;
    fillMap = new color[gridX][gridY];
  }

  void createFillMap() {
    initialFill(#ffffff);
    colorYellow();
    colorOrange();
    colorBlack();
    colorBrown();
    colorRed();
    drawEar();
    blink(blinking);
  }

  void blink(boolean b) {
    color c = #ffffff;
    if (b) {
      c = #000000;
    }
    fillMap[1][7] = c;
    fillMap[5][9] = c;
  }

  void interact() {
    if (keyCode == UP) {
      earToggle = true;
    } else if (keyCode == DOWN) {
      earToggle = false;
    }
  }

  void drawEar() {
    if (earToggle) {
      int[][] brown = {
        {12},{11,12}
      };
      int[][] black = {{12},{11,13},{10},{12}};
       fillColor(brown, #845b09,2);
              fillColor(black, #000000,1);

    } 

  }

  void colorYellow() {
    int[][] yellowFill = {
      {16}, {5, 15}, {4, 5, 14}, {4}, {3, 4, 5, 6, 9, 10}, {2, 3, 4, 5, 6, 7, 8, 9, 10}, {2, 3, 4, 5, 6, 7, 8, 9}, {2, 3, 4, 5, 6, 7, 8, 9, 10}, {1, 2, 3, 4, 7, 8, 9, 10, 11}, {2, 3, 4, 7, 8, 9, 10}, 
      {4, 5, 6, 9}, {4, 5, 6}, {2, 9}, {4, 5, 6, 7, 8}, {5, 6, 7, 9}, {}, {7, 8, 9}, {}, {9, 10, 11}
    };
    fillColor(yellowFill, #ffff00, 1);
  }

  void colorOrange() {
    int[][] orangeFill = {
      {16, 17}, {15, 16, 17}, {5, 14, 15, 16}, {13, 14, 15}, {13, 14}, {10, 14, 15}, {14, 15}, {14}, {11}, {3, 10, 11, 12}, {3, 8, 9, 10}, {3, 4, 5, 6, 7, 8, 10, 11, 12}, 
      {10, 11}, {4, 10, 11, 12}, {3, 5, 6, 7, 8, 10, 11, 12}, {10, 11}, {10}, {11}
    };
    fillColor(orangeFill, #ff7701, 2);
  }

  void colorBlack() {
    int[][] blackFill = {
      {5, 6, 16}, {4, 6, 15, 17}, {4, 6, 14, 18}, {3, 6, 11, 12, 13, 18}, {3, 6, 9, 10, 13, 17}, {2, 7, 8, 12, 16}, {1, 11, 12, 15}, {0, 11, 13, 16}, {0, 1, 11, 13, 16}, {0, 6, 12, 13, 15}, 
      {1, 5, 6, 12, 13, 14}, {2, 13}, {2, 13}, {1, 13}, {2, 3, 9, 13}, {3, 8, 13}, {2, 4, 9, 13}, {2, 3, 4, 5, 6, 7, 12}, {7, 8, 9, 11, 12}, {8, 12}, {9, 10, 11}
    };
    fillColor(blackFill, #000000, 0);
  }

  void colorBrown() {
    color b = #845b09;
    fillMap[5][1] = b;
    fillMap[11][4] = b;
    fillMap[12][4] = b;
    fillMap[11][5] = b;
    fillMap[11][12] = b;
    fillMap[12][12] = b;
    fillMap[12][14] = b;
  }

  void colorRed() {
    color r = #fe0000;
    fillMap[7][11]  = r;
    fillMap[8][11] = r;
    fillMap[7][12] = r;
  }
}
