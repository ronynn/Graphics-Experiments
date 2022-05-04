new Q5("global");

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(10);
  frameRate(2);
  colorMode(HSB, height, height, height);
  noStroke();
  r = height;
}

function draw() {
  if (r > 0) {
    fill(r, height - r, height - r / 2);
    circle(width / 2, height / 2, r);
    r -= random(height / 10);
  }
}

function mousePressed() {
  background(0);
  r = height;
}