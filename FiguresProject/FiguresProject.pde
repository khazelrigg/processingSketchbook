import java.util.Map;
int gridX = 21;
int gridY = 32;
int gridSize = 20;

color bgColor = #668baa;
int stroke = 1;
boolean helpToggle = false;
boolean toggle = false;

Figure[] figures = {new Pikachu(), new Bart()};
Figure current = figures[0];
int figIndex = 0;

void setup() {
  current =figures[0];
  current. createFillMap();
  strokeWeight(stroke);
  frameRate(60);
  surface.setSize(gridSize * current.gridX, gridSize * current.gridY);
}

void draw() {
  current.draw();
}


void mousePressed() {
  current.blinking = true;
  current.interact();
}

void mouseReleased() {
  current.blinking = false;
}

void keyPressed() {
  switch (key) {
    case('?'):
      helpToggle = !helpToggle;
      break;
    case('='):
    scale(true);
    break;
    case('-'):
    scale(false);
    break;

    case(' '):
    nextFigure();
    break;

  default:
    current.interact();
  }
}

void mouseWheel(MouseEvent event) {
  float maxStroke = 0.8;
  float e = event.getCount();
  stroke(#888888);

  if (stroke + e < 0) {
    stroke = 0;
  } else if (stroke + e > gridSize * maxStroke) {
    stroke = int(gridSize * maxStroke);
  } else {
    stroke += e;
  }
  strokeWeight(stroke);
}

void scale(boolean b) {
  int maxSize = 1080 / gridSize;

  if (b) {
    gridSize += 1;
  } else {
    gridSize -= 1;
  }
  if (gridSize < 2) {
    gridSize = 2;
  } else  if (gridSize > maxSize) {
    gridSize = maxSize + 1;
  }
  surface.setSize(gridSize * current.gridX, gridSize * current.gridY);
}


void nextFigure() {
  if (figIndex + 1 >= figures.length) {
    figIndex = 0;
  } else {
    figIndex++;
  }
  current = figures[figIndex];
  surface.setSize(gridSize * current.gridX, gridSize * current.gridY);
}

color getRandomColor() {
  return color(int(random(255)), int(random(255)), int(random(255)));
}
