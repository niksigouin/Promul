import java.util.Arrays;
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

ArrayList userList = new ArrayList();
String user;

void setup() {
  size(800, 600);
  oscP5 = new OscP5(this, 3334);

  myRemoteLocation = new NetAddress("127.0.0.1", 3334);
}

void draw() {
  background(0);
}

void oscEvent(OscMessage m) {
    String address = m.addrPattern();
  // Gets the first value of the osc message (Use of idex is for an array of values
  // EX: 
  // OSC MESSAGE OBJECT -> {IP ADDRESS}/XYPAD [12, 19]
  // int x = theOscMessage.get(0).intValue();
  // int y = theOscMessage.get(1).intValue();

  // if (m.checkAddrPattern("/client")) {
  //   //userList = m.arguments();
  //   //String[] users = new String[userList.length];
  //   //System.arraycopy(userList,0,users,0,userList.length);
  //   //println(users.toString());
  if (address.equals("/userJoin")) {
    user = m.get(0).stringValue();
    println("Joined: " + user);
    userList.add(user);
    
    // #### Appends new user to userList ### //
    onUpdate();
    
  } else if (address.equals("/userLeft")) {
    
    user = m.get(0).stringValue();
    println("Disconnected: " + user);
    int index = userList.indexOf(user);
    userList.remove(index);
    
    String user = m.get(0).stringValue();
    println("Left: " + user);
    onUpdate();
    
  } 
  
  
  //else if (address.equals("/button")) {
  //  int value = m.get(0).intValue();
  //  println(m.typetag());
  //  println(value);
  //}
}

void onUpdate() {
  println(userList.size());
  printArray(userList);
}
