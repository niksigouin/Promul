color subBottomColor, subPanelColor, windowColor;

void setup() {
  size(1280, 720);
  noStroke();
  smooth();
}

void draw() {
  background(83);
  subBottomColor = 50;
  subPanelColor = #3f71e1;
  windowColor = color(128, 193, 255, 102);

  //fill(#00ff00);
  //rect(0, height * 0.2, width, 250);
  subway(width * 0.2, height * 0.75, 2);
}

void subway(float _x, float _y, int _wagonAmount) {  
  float wagonW = width * 0.6;
  pushMatrix();
  translate(_x, _y);
  cabin(0, 0);
  for (int i=0; i < _wagonAmount; i++) {
    wagon(wagonW*i, 0);
  }

  //wagon(0, 0);
  pushMatrix();
  scale(-1, 1);
  translate(-wagonW*_wagonAmount, 0);
  cabin(0, 0);
  popMatrix();

  popMatrix();
}

void cabin(float _x, float _y) {
  fill(179, 179, 179, 255);

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
  accessPanel(150, 60);
  popMatrix();
}

void wagon(float _x, float _y) {
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
  pushMatrix();
  translate(_x, _y);
  fill(subBottomColor);
  rect(0, 0, wagonW, wagonH-20.0);
  float wheelOffset = 155;
  wheelDuo(wheelOffset, 80);
  wheelDuo(wagonW-wheelOffset, 80);
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

  //// DEBUG LINES
  //float divAmount = 5;
  //float div = wagonW / divAmount;

  //pushMatrix();
  //translate(_x, _y-topH);
  //stroke(0);
  //strokeWeight(2);
  //line(_x + div, 0, _x + div, topH);
  //line(_x + div*2, 0, _x + div*2, topH);
  //line(_x + div*3, 0, _x + div*3, topH);
  //line(_x + div*4, 0, _x + div*4, topH);
  //line(_x + div*5, 0, _x + div*5, topH);
  //popMatrix();
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
  fill(20);
  //rect(0, -25, 180, 80); // BACK PLATE
  fill(34);
  rect(0, ((-springStrutH/2) - springH/2)+12.0, springStrutW/2, springStrutH, 10); // VERTIVCAL STRUT
  for (float i=1; i < numSpring - 1; i += 1.0) {                           /***********************/
    fill(75);                                                              /*  SPRINGS ON STRUT   */
    rect(0, ((-springStrutH) + (i*springH)) + 12.0, springStrutW, springH, 43);     /***********************/
  }
  fill(60);
  //rect(0,0,150,(springStrutW/2)-6.6); // HORIZONTAL STRUT
  popStyle();
  wheel(-75, 0);
  wheel(75, 0);
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


  pushStyle();
  fill(18);
  float boltSize = 8.0;
  int numBolts = 6;
  float theta = TWO_PI / numBolts;
  float boltRad = (wheelSize * 0.17);

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

void accessPanel(float _x, float _y) {
  float accessPanelW = 100;
  float accessPanelH = 50;

  pushMatrix();
  translate(_x, _y);
  fill(0);
  rect(0, -accessPanelH/2, accessPanelW, accessPanelH);
  popMatrix();
}
