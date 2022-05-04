new Q5("global");

var lastX = 0;
var lastY = 10;
var baseline = 20;
var maxX = 0;

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(30);
  colorMode(HSB);
}

function draw() {
  var x = lastX + random(-10, 20);
  var y = baseline + random(-10, 10);

  if (random(20) > 17) {
    lastX = maxX + random(20, 30);
    x = lastX;
    y = baseline;
    stroke(lastX % 255, 255, 255);
  }
  line(lastX, lastY, x, y);
  lastX = x;
  lastY = y;
  maxX = max(maxX, x);

  if (lastX >= width) {
    baseline += 30;
    lastX = 0;
    maxX = 0;
    lastY = baseline;
  }

  if (baseline >= height) {
    clear();
    lastX = 0;
    maxX = 0;
    lastY = 10;
    baseline = 20;
  }
}