
void setup() {
  size(1280, 720);
}

void draw() {
  background(106);
  //fill(#00ff00);
  //rect(width * 0.2, height * 0.2, width * 0.6, 250);
  subway(width * 0.2, height * 0.75);
}

void subway(float _x, float _y) {  
  pushMatrix();
  translate(_x, _y);
  cabin(0, 0);
  wagon(0, 0);

  popMatrix();
}

void cabin(float _x, float _y) {
  float cabinW = width * 0.2;
  float cabinH = 130;

  // TOP SECTION
  pushMatrix();
  translate(_x, _y);
  popMatrix();

  // BOTTOM SECTION
  pushMatrix();
  translate(_x-cabinW, _y);
  fill(#767676);
  rect(0, 0, cabinW, cabinH);
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
  color windowColor = 1923808251;
  float windowW = topW * 0.25;
  float windowH = ((topH - wagonOffsetBig) * 0.60)+wagonOffset;

  // ########## BOTTOM SECTION ##########
  // *************ADD WHEELS AND SHIT***********
  pushMatrix();
  translate(_x, _y);
  fill(#767676);
  rect(0, 0, wagonW, wagonH);
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
  fill(255, 255, 255);
  rect(0, windowH+wagonOffsetBig, (wagonW * 0.50) - doorW/2, (doorH * 0.40)-wagonOffset); // BOTTOM LEFT
  rect((wagonW * 0.50) + doorW/2, windowH+wagonOffsetBig, (wagonW * 0.50) - doorW/2, (doorH * 0.40)-wagonOffset); // BOTTOM RIGHT
  popMatrix();

  // WINDOWS
  // LEFT
  pushMatrix();
  translate((_x + (wagonW * 0.20 - (windowW * 0.50))), _y-doorH);
  //line(windowW/2, 0, windowW/2, windowH); // DEGUB LINE
  fill(windowColor);
  stroke(0);
  rect(0, 0, windowW, windowH);
  popMatrix();

  // RIGHT
  pushMatrix();
  translate((_x + (wagonW * 0.80 - (windowW * 0.50))), _y-doorH);
  //line(windowW/2, 0, windowW/2, windowH); // DEGUB LINE
  fill(windowColor);
  stroke(0);
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
  stroke(0);
  noFill();
  rect(0, 0, doorW, doorH); // CONTOUR
  fill(#c9f8fa, 140);
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
  stroke(0);
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










float ign;
