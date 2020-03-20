import java.util.*;
import java.io.*;
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

ArrayList clientList = new ArrayList();
ArrayList<Player> players = new ArrayList<Player>();

// LOCAL PLAYER
Player localPlayer;
String localPlayerDir;

String client;
float floorWallSplit = 0.75;
boolean debug = false; // SHOW DEBUG UI

void setup() {
  size(1280, 720, P2D);
  smooth();
  oscP5 = new OscP5(this, 3334);
  myRemoteLocation = new NetAddress("127.0.0.1", 3334);
  debug = true;
  localPlayer = new Player(width/2, height * floorWallSplit, 65, 130, "LOCAL");
}

void draw() {
  background(106);
  //redraw();
  // Background art work


  wall(0, 0, width, height * floorWallSplit);
  entry(width/2, height * floorWallSplit, 482.0, 626.0);
  pushMatrix();
  translate(77/2, height * floorWallSplit);
  bench(0, 0, 75, 45);
  bench(75, 0, 75, 45);
  bench(75*2, 0, 75, 45);
  popMatrix();
  subFloor(0, height * floorWallSplit, width, height - height * floorWallSplit);
  metroMap(260, 320, 0.25);


  // Draws the UI
  if (debug) {
    UI();
  }

  for (int i=0; i < players.size(); i++) {
    players.get(i).display();
  }

  // LOCAL PLAYER DISPLAY
  localPlayer.display();
  
  // LOCAL PLAYER MOVEMENT
  if (keyPressed) {
    switch(key) {
    case 'a':
      localPlayer.move("L");
      break;
    case 'w':
      //localPlayer.move("U");
      break;
    case 'd':
      localPlayer.move("R");
      break;
    default:
      localPlayer.move("ENTER");
      break;
    }
  }
}

void oscEvent(OscMessage m) {
  String address = m.addrPattern();
  // Gets the first value of the osc message (Use of idex is for an array of values
  // EX: 
  // OSC MESSAGE OBJECT -> {IP ADDRESS}/XYPAD [12, 19]
  // int x = theOscMessage.get(0).intValue();
  // int y = theOscMessage.get(1).intValue();

  // #### Appends new client to clientList ### //
  if (address.equals("/clientJoin")) {

    // LOGISTIQUE
    client = m.get(0).stringValue();
    println("Joined: " + client);
    clientList.add(client);

    // ADDS NEW PLAYER TO THE SCENE
    players.add(new Player(width/2, height * floorWallSplit, 65, 130, client));

    //printArray(players);
    printArray(clientList);
  } 
  // #### Removes the diconnected client from clientList ### //
  else if (address.equals("/clientLeft")) {

    // LOGISTIQUE
    client = m.get(0).stringValue(); // Grabs the client IP
    int index = clientList.indexOf(client); // Gets the index of the disconnected client
    clientList.remove(index); // Removes the client from the connected client list
    players.remove(index); // Removes the player with the index of the disconnected client



    // DEBUG PRINTSSSSSSSS
    println("Left: " + client);
    printArray(clientList);
    //printArray(players);
  } 

  if (address.equals("/button")) {

    // LOGISTIQUE
    client = m.get(0).stringValue(); // Grabs the client IP
    String dir = m.get(1).stringValue();

    int index = clientList.indexOf(client); // Gets the index of the client transmitting

    players.get(index).move(dir); // Move player
  } 

  //String addr = m.addrPattern();
  //String ad = m.get(0).stringValue();
  //String toggle = m.get(1).stringValue();

  //println(addr, ad, toggle);
  //println(ad);
  //println(toggle);

  //println(m);
}

void UI() {
  fill(255);
  textAlign(LEFT, BOTTOM);
  textSize(20);
  text("Clients: " + clientList, 5, height-5);
}

// ####### BACKGROUND STUFFF #######

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

void wall(float _x, float _y, float _w, float _h) {
  pushMatrix();

  float numX = 38.00;
  float numY = 47.00;

  float brickW = (_w) / numX;
  float brickH = (_h) / numY;

  translate(_x - (brickW/2), _y);

  fill(#6e202b);
  for (float horz=0; horz <= numX; horz ++) {
    for (float vert=0; vert <= numY-1; vert ++) {
      pushMatrix();
      translate(brickW * horz, brickH * vert);
      stroke(0);
      strokeWeight(1.0);

      if ((vert) % 2 == 0) { // Alligned bricks
        translate(brickW/2, 0);
        rect(0, 0, brickW, brickH);
      } else { // Offset bricks
        rect(0, 0, brickW, brickH);
      }
      popMatrix();
    }
  }
  popMatrix();
}

void entry(float _x, float _y, float _w, float _h) {
  pushMatrix();
  translate(_x + 0.00, _y + -23.51);
  rectMode(CENTER);
  noStroke();
  fill(106);
  rect(0, 0, _w, _h, 246);
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
