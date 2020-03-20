//float brickColor;
float floorWallSplit = 0.75;
ArrayList brickColors;

void setup() {
  size(1280, 720);
  brickColors = randomColor(10000);
  //println(brickColors);
}

void draw() {
  background(166);
  smooth();


  wall(0, 300, width, (height * floorWallSplit)- 300);
  banner(0, 300, width);
  entry(width/2, height * floorWallSplit, 477.4, height*floorWallSplit); //554.9
  pushMatrix();
  translate(77/2, height * floorWallSplit);
  bench(0, 0, 75, 45);
  bench(75, 0, 75, 45);
  bench(75*2, 0, 75, 45);
  popMatrix();
  subFloor(0, height * floorWallSplit, width, height - height * floorWallSplit);
  metroMap(260, 337, 0.25);

  //// CENTER
  //stroke(#00FF00);
  //strokeWeight(2);
  //line(width * 0.50, 0, width * 0.50, height); // Horz.
  //line(0, height * 0.50, width, height * 0.50); // Vert.
}

void subFloor(float _x, float _y, float _w, float _h) {
  pushMatrix();
  rectMode(CORNER);
  translate(_x, _y);

  // MAIN FLOOR
  noStroke();
  fill(35);
  rect(0, 0, _w, _h);

  // TOP FLOOR GARDE
  noStroke();
  fill(75);
  rect(0, 0, _w, _h - _h + 40); // - height * 0.20
  popMatrix();
}

void banner(float _x, float _y, float _w) {
  pushMatrix();
  // BLACK BANNER
  float bannerH = 40;
  translate(_x, _y-bannerH);
  fill(0);
  noStroke();
  rect(0, 0, _w, bannerH);
  popMatrix();

  textAlign(CENTER, CENTER);
  fill(255);
  textSize(20.00);
  text("ALGO", _w * 0.19, _y-bannerH * 0.56);
  text("ALGO", _w - _w * 0.19, _y-bannerH * 0.56);
}

void wall(float _x, float _y, float _w, float _h) {
  pushMatrix();

  float brickSize = 10;

  float numX = (_w) / brickSize;
  float numY = (_h) / brickSize;

  int colorCount = 0;

  translate(_x, _y);

  // TILES
  for (float horz=0; horz <= numX; horz ++) {
    for (float vert=0; vert <= numY; vert ++) {
      drawTile(brickSize * horz, brickSize * vert, brickSize, brickSize, colorCount++);
    }
  }
  popMatrix();
}

void drawTile(float _x, float _y, float _w, float _h, int _color) {
  pushMatrix();
  translate(_x, _y);
  stroke(#777777);
  strokeWeight(1.5);
  fill((color)brickColors.get(_color));
  rect(0, 0, _w, _h);
  popMatrix();
}

void entry(float _x, float _y, float _w, float _h) {
  pushMatrix();
  translate(_x + 0.00, _y + 30.0);
  rectMode(CENTER);
  noStroke();
  fill(106);
  rect(0, 0, _w, _h, 0);
  popMatrix();
}

void bench(float _x, float _y, float _w, float _h) {
  pushMatrix();
  float benchStrokeWeight = 2.0;
  translate(_x + 0.00, _y - _h/2);
  rectMode(CENTER);
  fill(#0d0dab);
  //noStroke();
  stroke(#000000);
  strokeWeight(benchStrokeWeight);
  rect(0, -35, _w, _h + 40.00, 21); // TOP PART
  pushStyle();
  fill(#1d1d6b);
  strokeWeight(benchStrokeWeight * 0.60);
  rect(0, -50, _w - 15.00, _h + -10.00, 13); // BACK CUSHION
  popStyle();
  rect(0, 0 - benchStrokeWeight/2, _w, _h, 0); // BOTTON PART

  popMatrix();
}

void metroMap(float _x, float _y, float _s) {
  pushMatrix();
  translate(_x, _y);
  scale(_s);
  fill(-16777216);
  strokeWeight(1.0);
  stroke(0);
  pushMatrix();
  translate(200.0, 300.0);
  rotate(0.0);
  beginShape();
  vertex(-200.0, 300.0);
  vertex(-200.0, -300.0);
  vertex(200.0, -300.0);
  vertex(200.0, 300.0);
  endShape(CLOSE);
  popMatrix();

  fill(-15060071);
  strokeWeight(1.0);
  stroke(0);
  pushMatrix();
  translate(60.0, 80.0);
  rotate(1.5707965);
  rectMode(CORNERS);
  rect(-53.133347, -34.039646, 47.750492, 34.211006);
  popMatrix();

  strokeWeight(10.0);
  stroke(-26368);
  line(140.0, 200.0, 40.0, 200.0);
  strokeWeight(10.0);
  stroke(-26368);
  line(300.0, 380.0, 140.0, 200.0);
  strokeWeight(10.0);
  stroke(-26368);
  line(300.0, 380.0, 180.0, 500.0);
  strokeWeight(10.0);
  stroke(-26368);
  line(180.0, 500.0, 60.0, 360.0);
  strokeWeight(10.0);
  stroke(-16740609);
  line(120.0, 440.0, 160.0, 400.0);
  strokeWeight(10.0);
  stroke(-16740609);
  line(160.0, 400.0, 160.0, 320.0);
  strokeWeight(10.0);
  stroke(-16740609);
  line(160.0, 320.0, 260.0, 220.0);
  strokeWeight(10.0);
  stroke(-16727744);
  line(230.0, 510.0, 180.0, 560.0);
  strokeWeight(10.0);
  stroke(-16727744);
  line(230.0, 510.0, 180.0, 460.0);
  strokeWeight(10.0);
  stroke(-16727744);
  line(180.0, 460.0, 340.0, 300.0);
  strokeWeight(10.0);
  stroke(-16727744);
  line(340.0, 300.0, 320.0, 280.0);
  strokeWeight(10.0);
  stroke(-16727744);
  line(320.0, 280.0, 350.0, 250.0);
  strokeWeight(10.0);
  stroke(-16727744);
  line(350.0, 250.0, 330.0, 230.0);
  strokeWeight(10.0);
  stroke(-16727744);
  line(330.0, 230.0, 360.0, 200.0);
  noFill();
  stroke(-1644826);
  strokeWeight(10.0);
  bezier(140.0, 80.0, 220.0, 20.0, 160.0, 80.0, 240.0, 80.0);

  noFill();
  stroke(-1644826);
  strokeWeight(10.0);
  bezier(240.0, 80.0, 300.0, 50.0, 275.0, 75.0, 340.0, 80.0);

  noFill();
  strokeWeight(10.0);
  stroke(-6710887);
  pushMatrix();
  translate(200.0, 300.0);
  rotate(0.0);
  beginShape();
  vertex(-190.0, -290.0);
  vertex(190.0, -290.0);
  vertex(190.0, 290.0);
  vertex(-190.0, 290.0);
  endShape(CLOSE);
  popMatrix();

  noFill();
  strokeWeight(10.0);
  stroke(-3355444);
  pushMatrix();
  translate(200.0, 300.0);
  rotate(0.0);
  beginShape();
  vertex(-200.0, -300.0);
  vertex(200.0, -300.0);
  vertex(200.0, 300.0);
  vertex(-200.0, 300.0);
  endShape(CLOSE);
  popMatrix();

  noFill();
  stroke(-1644826);
  strokeWeight(10.0);
  bezier(280.0, 550.0, 330.0, 500.0, 310.0, 580.0, 360.0, 540.0);

  popMatrix();
}

// FUNCTIONS
// Function that stores and returns a random color from a given color pallette
ArrayList randomColor(int _size) {

  // Creates an array of colors & inital size of color palette
  color[] colorPalette = new color[3]; 
  // Colors in palette
  //colorPalette[0] = #EEEEEE;
  //colorPalette[1] = #CCCCCC;
  //colorPalette[2] = #999999;
  colorPalette[0] = color(151,160,141);
  colorPalette[1] = color(148,152,117);
  colorPalette[2] = color(114,116,92);

  // Creates temporary palette with random color assignement
  ArrayList tempArray = new ArrayList();

  // Parses through the given palette and adds a radom color from said palette to new color Array
  for (int i=0; i < _size; i++) {
    tempArray.add(colorPalette[round(random(0, colorPalette.length-1))]);
  }

  // Returns an array of randomly sorted colors
  return tempArray;
}
