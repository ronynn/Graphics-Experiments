new Q5("global");

function setup() {
  createCanvas(windowWidth, windowHeight);
  noFill();
  stroke(255);
  strokeWeight(8);
}

function draw() {
  background(32);

  // corner circles
  circle(0, 0, 250);
  circle(350, 0, 300);
  circle(0, 300, 350);
  circle(300, 320, 300);

  // top, bottom, left, and right circles
  circle(150, 0, 300);
  circle(150, 300, 600);
  circle(0, 150, 300);
  circle(300, 150, 300);

  // centered circles
  circle(10, 150, 300);
  circle(150, 150, 150);
}