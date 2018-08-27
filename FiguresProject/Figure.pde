abstract class Figure {
  int gridX;
  int gridY;
  color[][] fillMap;
  boolean blinking = false;

  abstract void createFillMap();
  abstract void blink(boolean b);  
  abstract void interact();

  void draw() {
    if (helpToggle) {
      showHelp();
    } else {
      createFillMap();
      drawFillMap();
    }
  }

  void drawFillMap() {
    for (int r = 0; r < gridX; r++) {
      for (int c = 0; c < gridY; c++) {
        color curColor = fillMap[r][c];
        fill(curColor);
        rect(r * gridSize, c * gridSize, gridSize, gridSize);
      }
    }
  }

  void initialFill(color col) {
    // Fill in everythin with a background color
    for (int r = 0; r < gridX; r++) {
      for (int c = 0; c < gridY; c++) {
        fillMap[r][c] = col;
      }
    }
  }

  void fillColor(int[][] pixels, color c, int rowOffset) {
    for (int row = 0; row < pixels.length; row++) {
      for (int col = 0; col < pixels[row].length; col++) {
        fillMap[pixels[row][col]][row + rowOffset] = c;
      }
    }
  }

  void showHelp() {
    fill(#ffffff);
    rect(0, 0, gridX * gridSize, gridY * gridSize);
    fill(#000000);
    textSize(32);
    text("Help:", 10, 30);

    textSize(20);
    String[] textLines = {
      "Space: Next Figure",
      "= : Enlarge size of grid by 1", 
      "- : Decrease size of grid by 1", 
      "LMouse : Interact", 
      "? : Toggle this help page", };

    for (int i = 0; i < textLines.length; i++) {
      text(textLines[i], 10, 60 + 30*i);
    }
  }
}
