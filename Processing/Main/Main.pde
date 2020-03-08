import java.util.*;
import java.io.*;
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
Player player;

ArrayList clientList = new ArrayList();
ArrayList<Player> players = new ArrayList<Player>();

String client;

ListIterator iterator = players.listIterator(); 

float tempX; 

void setup() {
  size(1280, 720, P2D);
  smooth();
  oscP5 = new OscP5(this, 3334);
  myRemoteLocation = new NetAddress("127.0.0.1", 3334);
  

  //player = new Player(width/2, height/2, 20, 40, "NIKO");
}

void draw() {
  background(106);

  //randomSeed(200);

  fill(#FF0000);
  //circle(width/2, height/2, 20);
  //player.display();

  // Draws the UI
  UI();

  for (int i=0; i < players.size(); i++) {
    players.get(i).display();
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
    client = m.get(0).stringValue();
    players.add(new Player(60+tempX, height/2, 40, 80, client));
    tempX += 60;
    
    println("Joined: " + client);
    clientList.add(client);
    //randomSeed(564);
    //Player p = new Player(random(20, width-20), height/2, 40, 80, client);
    //players.add(p);
    
    
    
    printArray(players);
    printArray(clientList);
  } 
  // #### Removes the diconnected client from clientList ### //
  else if (address.equals("/clientLeft")) {

     // LOGISTIQUE
    client = m.get(0).stringValue();
    //String client = m.get(0).stringValue();
    int index = clientList.indexOf(client);
    clientList.remove(index);
    
    players.remove(index);
    
    //for(int i = players.size()-1; i >= 0; i--){
    //   if(players.get(i).id() == client){
    //      players.remove(i);
    //      //println(players.get(i).id());
    //   }
       
       
    //}
    
    
    // DEBUG PRINTSSSSSSSS
    println("Left: " + client);
    printArray(clientList);
    printArray(players);
  } 

  //println(m);


  //else if (address.equals("/button")) {
  //  int value = m.get(0).intValue();
  //  println(m.typetag());
  //  println(value);
  //}
}


void UI() {
  fill(255);
  textAlign(LEFT, BOTTOM);
  textSize(20);
  text("Clients: " + clientList, 5, height-5);
}

void player(float _x, float _y, float _w, float _h, String _id) {
  rectMode(CENTER);
  pushMatrix();
  translate(_x, _y);
  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(0, 0, _w, _h, 20);
  textAlign(CENTER, BOTTOM);
  text(_id, 0, -_h/2);
  popMatrix();
}
