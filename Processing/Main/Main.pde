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

  randomSeed(600);

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
    
    // LOGISTIQUE
    client = m.get(0).stringValue();
    println("Joined: " + client);
    clientList.add(client);
    
    // ADDS NEW PLAYER TO THE SCENE
    players.add(new Player(60+tempX, height/2, 40, 80, client));
    tempX += 60;
    
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
    printArray(players);
  } 



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
