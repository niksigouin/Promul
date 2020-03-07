import java.util.Arrays;
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

ArrayList clientList = new ArrayList();

String client;

void setup() {
  size(1280, 720);
  oscP5 = new OscP5(this, 3334);
  myRemoteLocation = new NetAddress("127.0.0.1", 3334);
}

void draw() {
  background(106);

  randomSeed(200);
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
    println("Joined: " + client);
    clientList.add(client);
    printArray(clientList);
  } 
  // #### Removes the diconnected client from clientList ### //
  else if (address.equals("/clientLeft")) {

    client = m.get(0).stringValue();
    println("Disconnected: " + client);
    int index = clientList.indexOf(client);
    clientList.remove(index);

    String client = m.get(0).stringValue();
    println("Left: " + client);
    printArray(clientList);
  } 

  //println(m);


  //else if (address.equals("/button")) {
  //  int value = m.get(0).intValue();
  //  println(m.typetag());
  //  println(value);
  //}
}

//void onUpdate() {
//  //println(clientList.size());
//  //printArray(clientList);
//}
