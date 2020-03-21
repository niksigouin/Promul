import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

// SUBWAY ANIMATOR
AniSequence seq;

// SUBWAY COLORS
color subBottomColor, subPanelColor, windowColor;

//float angle, speed;
float subPosX, subLength;
int count;

//float brickColor;
float floorWallSplit = 0.75;
ArrayList brickColors;

void setup() {
  size(1280, 720);
  brickColors = randomColor(10000);
  smooth();
  
  subPosX = width;
  subLength = ((width * 0.6) * 8) + ((width * 0.2)*2);

  Ani.init(this);
  seq = new AniSequence(this);

  trainMove();
}

void draw() {
  background(166);
  smooth();

  pushStyle();
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
  popStyle();

  //// CENTER
  //stroke(#00FF00);
  //strokeWeight(2);
  //line(width * 0.50, 0, width * 0.50, height); // Horz.
  //line(0, height * 0.50, width, height * 0.50); // Vert.
  
  // SUBWAY CAR
  subBottomColor = 50;
  subPanelColor = #3f71e1;
  windowColor = color(128, 193, 255, 102);

  subway(subPosX, height * 0.75, 8);

  // SUBWAY ANIMATION REPEATER
  if(seq.isEnded()){
     seq.start();
  }
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

void trainMove() {
  seq.beginSequence();
  seq.add(Ani.to(this, 5, 20, "subPosX", -subLength/2, Ani.QUINT_OUT));
  seq.add(Ani.to(this, 5, 5, "subPosX", -subLength*2, Ani.QUINT_IN));
  seq.endSequence();
  seq.start();
}

// DRAWS SUBWAY WITH SPECIFIED AMOUNT OF WAGONS AND BOTH CONTROL CABINS
void subway(float _x, float _y, int _wagonAmount) {  
  float wagonW = width * 0.6;
  pushMatrix();
  // MAKES THE START POINT THE ABSOLUTE START POINT
  translate(_x + (width * 0.2), _y);

  // DRAW AMOUNT OF WAGONS
  for (int i=0; i < _wagonAmount; i++) {
    wagon(wagonW*i, 0);
  }

  // HEAD OF SUBWAY
  cabin(0, 0);

  // ASS OF SUBWAY
  pushMatrix();
  scale(-1, 1);
  translate(-wagonW*_wagonAmount, 0);
  cabin(0, 0);
  popMatrix();
  popMatrix();
}

void cabin(float _x, float _y) {
  fill(179, 179, 179, 255);

  // CABIN VARS
  float cabinW = width * 0.2;
  float cabinH = 250;

  float bottomW = cabinW;
  float bottomH = 130;

  // TOP SECTION
  pushMatrix();
  translate(_x-cabinW, _y);

  float botPH = 82;
  pushStyle();
  fill(subPanelColor);
  rect(0, -botPH, cabinW, botPH); // Bottom Panel
  fill(#e6e5b9);
  rect(0, -cabinH * 0.31, 12, 28, 0, 20, 20, 0); // LIGHT 1
  fill(#dc9581);
  rect(0, -cabinH * 0.18, 12, 28, 0, 20, 20, 0); // LIGHT 2
  popStyle();

  float rightPW = cabinW * 0.40;
  float rightPH = cabinH - botPH;
  rect(cabinW-rightPW, -cabinH, rightPW, rightPH); // Right panel


  // WINDOW FRAME
  beginShape();
  curveVertex(cabinH/2, -cabinH);
  curveVertex(-0.5, -botPH);
  curveVertex((bottomW-rightPW)+0.5, -botPH-rightPH);
  curveVertex(1075, -cabinH/2);
  vertex((bottomW-rightPW)+0.5, -botPH); // CENTER

  // Contour for window
  beginContour();
  curveVertex(920, (-cabinH/2)+20.0);
  curveVertex((bottomW-rightPW)+0.0, (-botPH-rightPH)+20.0);
  curveVertex(20, -botPH+0.0);
  curveVertex((cabinH/2)+20.0, -cabinH+92.4);
  vertex((bottomW-rightPW)+0.0, -botPH+0.0); // CENTER
  endContour();
  endShape(CLOSE);


  // WINDOW
  beginShape();
  fill(windowColor);
  curveVertex(920, (-cabinH/2)+20.0);
  curveVertex((bottomW-rightPW)+0.0, (-botPH-rightPH)+20.0);
  curveVertex(20, -botPH+0.0);
  curveVertex((cabinH/2)+20.0, -cabinH+92.4);
  vertex((bottomW-rightPW)+0.0, -botPH+0.0); // CENTER
  endShape(OPEN);
  popMatrix();

  // ##### BOTTOM SECTION ######
  pushMatrix();
  translate(_x-bottomW, _y);
  fill(subBottomColor);
  rect(0, 0, bottomW, bottomH-20, 0, 0, 0, 61); // MAIN PEICE
  wheel(100, 80);
  accessPanel(220, 60);
  popMatrix();
}

void wagon(float _x, float _y) {
  // WAGON VARS
  float wagonW = width * 0.6;
  float wagonH = 130;
  float wagonOffset = 10;
  float wagonOffsetBig = 20;

  // TOP SECTION VARS
  float topW = wagonW;
  float topH = 250;

  // DOOR VARS
  float doorW = topW * 0.15;
  float doorH = topH - wagonOffsetBig;

  // WINDOW VARS
  float windowW = topW * 0.25;
  float windowH = ((topH - wagonOffsetBig) * 0.60)+wagonOffset;

  // ########## BOTTOM SECTION ##########
  float wheelOffset = 155;
  float accessPanelOffset = 331;


  // WHEELS AND ACCESSORIES UNDERNEATH
  pushMatrix();
  translate(_x, _y);
  fill(subBottomColor);
  rect(0, 0, wagonW, wagonH-20.0);
  wheelDuo(wheelOffset, 80);
  wheelDuo(wagonW-wheelOffset, 80);
  accessPanel(accessPanelOffset, 60);
  accessPanel(wagonW-accessPanelOffset, 60);
  popMatrix();

  // ########## TOP SECTION ##########
  // MAIN BODY
  pushMatrix();
  translate(_x, _y-topH);
  // FILL PLATES
  fill(179, 179, 179, 255);
  noStroke();
  rect(0, 0, topW, topH-doorH); // TOP
  rect(0, topH-doorH, (wagonW * 0.20) - windowW/2, windowH ); // LEFT MOST

  // FIX PIXEL OFFSET ISSUE IF YOU HAVE TIME
  rect((wagonW * 0.20) + windowW/2, topH-doorH, (wagonW * 0.20) - (doorW/2 + wagonOffset*2 - 1), windowH ); // LEFT CENTER
  rect((wagonW * 0.50)+(doorW/2), topH-doorH, (wagonW * 0.20) - (doorW/2 + wagonOffset*2 - 1), windowH); // RIGHT CENTER
  rect(wagonW - (wagonW * 0.20 - windowW/2), topH-doorH, (wagonW * 0.20) - windowW/2, windowH ); // RIGHT MOST
  fill(subPanelColor);
  rect(0, windowH+wagonOffsetBig, (wagonW * 0.50) - doorW/2, (doorH * 0.40)-wagonOffset); // BOTTOM LEFT 
  rect((wagonW * 0.50) + doorW/2, windowH+wagonOffsetBig, (wagonW * 0.50) - doorW/2, (doorH * 0.40)-wagonOffset); // BOTTOM RIGHT
  popMatrix();

  // WINDOWS
  // LEFT
  pushMatrix();
  translate((_x + (wagonW * 0.20 - (windowW * 0.50))), _y-doorH);
  //line(windowW/2, 0, windowW/2, windowH); // DEGUB LINE
  fill(windowColor);
  rect(0, 0, windowW, windowH);
  popMatrix();

  // RIGHT
  pushMatrix();
  translate((_x + (wagonW * 0.80 - (windowW * 0.50))), _y-doorH);
  //line(windowW/2, 0, windowW/2, windowH); // DEGUB LINE
  fill(windowColor);
  rect(0, 0, windowW, windowH);
  popMatrix();

  // WAGON DOOR
  pushMatrix();
  translate(_x + (wagonW/2 - doorW/2)+0.0, _y-doorH);
  fill(#c7c7c7);
  noStroke();
  rect(0, 0, doorW, wagonOffset); // TOP
  rect(0, (doorH * 0.60)+wagonOffset, doorW, (doorH * 0.40)-wagonOffset); // BOTTOM
  rect(0, wagonOffset, wagonOffset, doorH * 0.60); // LEFT
  rect(doorW-wagonOffset, wagonOffset, wagonOffset, doorH * 0.60); // LEFT
  //stroke(0);
  noFill();
  rect(0, 0, doorW, doorH); // CONTOUR
  // WINDOW
  fill(windowColor);
  rect(wagonOffset, wagonOffset, doorW - wagonOffset*2, doorH * 0.60); // DOOR WINDOW
  popMatrix();

  pushMatrix();
  translate(_x + (wagonW/2 - doorW/2), _y-doorH);
  fill(255, 255, 255, 0);
  rect(0, 0, doorW, doorH); // CONTOUR
  popMatrix();

  // SHELL LINING
  pushMatrix();
  translate(_x, _y-topH);
  fill(0, 0, 0, 0);
  //stroke(0);
  rect(0, 0, topW, topH);
  popMatrix();
}

void wheelDuo(float _x, float _y) {
  float springStrutW = 50;
  float springStrutH = 60;
  float springH = 10;
  float numSpring = springStrutH/springH;

  pushMatrix();
  translate(_x, _y);
  pushStyle();
  rectMode(CENTER);
  fill(34);
  rect(0, ((-springStrutH/2) - springH/2)+12.0, springStrutW/2, springStrutH, 10); // VERTIVCAL STRUT
  for (float i=1; i < numSpring - 1; i += 1.0) {                                   /***********************/
    fill(75);                                                                      /*  SPRINGS ON STRUT   */
    rect(0, ((-springStrutH) + (i*springH)) + 12.0, springStrutW, springH, 43);    /***********************/
  }
  popStyle();
  wheel(-75, 0); // WHEEL
  wheel(75, 0);  // WHEEL
  popMatrix();
}

void wheel(float _x, float _y) {
  float wheelSize = 85;

  pushMatrix();
  translate(_x, _y);
  rotate(radians(0));
  pushStyle();
  // TIRE
  fill(25);
  ellipseMode(CENTER);
  circle(0, 0, wheelSize); 
  // HUB
  fill(80);
  circle(0, 0, wheelSize * 0.5);
  popStyle();

  // FOR LOOP WITH BOLTS GOING AROUND THE HUB
  pushStyle();
  fill(18);
  float boltSize = 8.0;
  int numBolts = 6;
  float theta = TWO_PI / numBolts;
  float boltRad = (wheelSize * 0.17);

  // SIMPLE FORLOOP TO SCATTER EVENLY BOLTS IN A CIRCULAR MANER
  for (float a=0; a < numBolts; a++) {
    float myTheta = a*theta;
    float x = boltRad * cos(myTheta) + 0;
    float y = boltRad * sin(myTheta) + 0;
    pushMatrix();
    translate(x, y);
    rotate(radians(map(myTheta, 0, TWO_PI, 0, 360)));
    ellipse(0, 0, boltSize*0.5, boltSize);
    popMatrix();
  }
  popStyle();
  fill(38);
  circle(0, 0, wheelSize * 0.20);
  popMatrix();
}

// Black panel under subway
void accessPanel(float _x, float _y) {
  // 
  float accessPanelW = 100;
  float accessPanelH = 50;
  float accessBoltSize = 5;
  float accessBoltOffset = 8;

  pushMatrix();
  translate(_x, _y);
  fill(30);
  rect(-accessPanelW/2, -accessPanelH/2, accessPanelW, accessPanelH, 8); // MAIN PEICE

  // BOLTS
  fill(42);
  circle((-accessPanelW/2) + accessBoltOffset, (-accessPanelH/2) + accessBoltOffset, accessBoltSize); // TOP LEFT
  circle((accessPanelW/2) - accessBoltOffset, (-accessPanelH/2) + accessBoltOffset, accessBoltSize);  // TOP RIGHT
  circle((-accessPanelW/2) + accessBoltOffset, (accessPanelH/2) - accessBoltOffset, accessBoltSize); // BOTTOM LEFT
  circle((accessPanelW/2) - accessBoltOffset, (accessPanelH/2) - accessBoltOffset, accessBoltSize);  // BOTTOM RIGHT
  popMatrix();
}
