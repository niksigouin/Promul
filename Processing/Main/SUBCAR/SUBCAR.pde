import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

// SUBWAY COLORS
color subBottomColor, subPanelColor, windowColor;

float angle, speed;

void setup() {
  size(1280, 720);
  noStroke();
  smooth();
  
  angle = -1;
}

void draw() {
  background(83);
  subBottomColor = 50;
  subPanelColor = #3f71e1;
  windowColor = color(128, 193, 255, 102);
  
  // TRAIN MOUVEMENT SYSTEM
  speed = 0.02;
  boolean arrived = false;
  
  //if(arrived == false){
  //   angle = -1;
  //   arrived = true;
  //} else if(arrived && mousePressed) {
  //   //arrived = false; 
  //   angle += speed;
  //}
  
  //if(mousePressed){
  //   angle += speed;
  //}
  
  
  if(cos(angle) > 0.961){
     arrived = true;
  }
  
  if(arrived){
     
  } else {
    angle += speed;
  }
  
  float subwayLength = ((width * 0.6) * 8) + ((width * 0.2)*2);
  
  
  float trainMove = map(cos(angle), -1.0, 1.0, width, -width*4.3);
  //println(cos(angle));
  

  subway(trainMove, height * 0.75, 8);
  println(arrived, cos(angle), trainMove);
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
