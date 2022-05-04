
new Q5("global");

UP = 1;
DOWN = 2;
LEFT = 3;
RIGHT = 4;

var antX, antY;
var dir;

var field;

function setup() {
  createCanvas(windowWidth, windowHeight);
  
  dir = DOWN;
  antX = width / 2;
  antY = height / 2;

  // create playfield
  field = new Array(height);
  for (var y = 0; y < height; y++) {
    var line = new Array(width);
    for (var x = 0; x < width; x++) {
      line[x] = 0;
    }
    field[y] = line;
  }

  background(110);
  colorMode(HSB);
}

function draw() {
  var cell = field[antY][antX];
  if (cell >= 0) {
    switch (dir) {
      case LEFT:
        dir = DOWN;
        break;
      case RIGHT:
        dir = UP;
        break;
      case UP:
        dir = LEFT;
        break;
      case DOWN:
        dir = RIGHT;
        break;
    }
    cell += 4;
    stroke(cell, 255, 255);
    cell *= -1;
  } else {
    switch (dir) {
      case LEFT:
        dir = UP;
        break;
      case RIGHT:
        dir = DOWN;
        break;
      case UP:
        dir = RIGHT;
        break;
      case DOWN:
        dir = LEFT;
        break;
    }
    cell *= -1;
    cell += 4;
    stroke(0, 0, 0);
  }
  field[antY][antX] = cell;
  point(antX, antY);

  // move ant
  switch (dir) {
    case LEFT:
      if (antX > 0) {
        antX--;
      }
      break;
    case RIGHT:
      if (antX < width) {
        antX++;
      }
      break;
    case UP:
      if (antY > 0) {
        antY--;
      }
      break;
    case DOWN:
      if (antY < height) {
        antY++;
      }
      break;
  }
}