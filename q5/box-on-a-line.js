
new Q5("global");

function setup() {
  createCanvas(windowWidth, windowHeight);
  m = width / 2;
}

function draw() {
  rectMode(CORNER);
  noStroke();
  fill(0, 0, 0, 8);
  rect(0, 0, width, height);

  fill(random(32, 224));

  var h = random(5, 40);
  var w = random(5, 110);
  var p = random(0, height - h / 2);

  stroke(255);
  rectMode(CENTER);
  rect(m, p, w, h);
  line(m, 0, m, height);
}

function mousePressed() {
  background(0);
}