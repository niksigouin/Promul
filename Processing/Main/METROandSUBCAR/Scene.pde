void entry(float _x, float _y, float _w, float _h) {
  color alum = #848789; // ALUMINIUM COLOR
  pushMatrix();
  translate(_x-_w/2, _y);
  fill(73, 64, 48, 117);
  rect(0, 0, _w, _h); // DARKEN RECTANGLE
  fill(#7b7a7a); 


  // BACKGROUND ESCALATOR
  beginShape();
  bezier(157, _h, 150, 150, 182, 192, 255, 160);
  vertex(_w + 0.0, 40);
  vertex(_w + 0.0, _h + 0.0);
  endShape(CLOSE);
  popMatrix();
}

void ceelingGradient(int _finishHeight) {
  // MAKES UPPER CEELING GRADIENT
  pushStyle();
  float myHeight = _finishHeight;
  for (int i=0; i < myHeight; i++) {
    strokeWeight(1);
    stroke(map(i, 0, myHeight, 0, 255));
    line(0, i, width, i);
  }
  popStyle();
}

void concrete() {
  // UNDER SUBWAY CONCRETE
  float slabHeight = 57;

  pushMatrix();
  translate(0, height-slabHeight);
  pushStyle();
  noStroke();
  fill(176, 170, 170);
  rect(0, 0, width, slabHeight);

  for (int i=0; i < 600; i++) {
    strokeWeight(2);
    stroke((int) random(255));
    point(random(0, width), random(0, slabHeight));
  }

  popStyle();
  popMatrix();
}

void subFloor(float _x, float _y, float _w, float _h) {
  pushMatrix();
  rectMode(CORNER);
  translate(_x, _y);

  // MAIN FLOOR
  noStroke();
  fill(74);
  rect(0, 0, _w, _h);

  // TOP FLOOR GARDE
  noStroke();
  fill(43);
  rect(0, 0, _w, _h - _h + 40); // - height * 0.20
  popMatrix();
}

void banner(float _x, float _y, float _w) {
  pushMatrix();
  // BLACK BANNER
  float bannerH = 40;
  translate(_x, _y-bannerH);
  fill(27);
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

void trainTimeDisplay(float _x, float _y, float _w, float _h) {
  int nextTrain;

  if (seq.getTime() < 30 ) {
    nextTrain = (int) (30-seq.getTime());
  } else { 
    nextTrain = (int) ((seq.getDuration()+30)-seq.getTime());
  }

  pushMatrix();
  translate(_x, _y);
  fill(0);
  strokeWeight(3);
  rect(0, 0, _w, _h); // MAIN TV BG COLOR
  noStroke();
  fill(15, 29, 166);
  rect(1, 1, _w-1, _h*0.3);
  textAlign(CENTER, CENTER);
  textSize(14);
  fill(255);
  text("NEXT TRAIN IN:", _w * 0.50, _h * 0.14);
  textSize(20);
  text(nextTrain, _w * 0.40, _h * 0.60); // COUNT DOWN TEXT
  text("sec.", _w * 0.71, _h * 0.60);
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

// DRAWS METRO MAP ON TH WALL
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
  colorPalette[0] = color(151, 160, 141);
  colorPalette[1] = color(148, 152, 117);
  colorPalette[2] = color(114, 116, 92);

  // Creates temporary palette with random color assignement
  ArrayList tempArray = new ArrayList();

  // Parses through the given palette and adds a radom color from said palette to new color Array
  for (int i=0; i < _size; i++) {
    tempArray.add(colorPalette[round(random(0, colorPalette.length-1))]);
  }

  // Returns an array of randomly sorted colors
  return tempArray;
}
