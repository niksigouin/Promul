import java.util.Arrays;
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

String[] userList;

void setup() {
  size(800, 600);
  oscP5 = new OscP5(this, 3334);

  myRemoteLocation = new NetAddress("127.0.0.1", 3334);
}

void draw() {
  background(0);
  
}

void oscEvent(OscMessage m) {
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
    
    
  //   // CONVERTS THE OBJECT ARRAY INTO STRING ARRAY
  //   userList = Arrays.asList(m.arguments()).toArray(new String[m.arguments().length]);
    
  //   println(userList.length);

    
  //   for (int i = 0; i < userList.length; i++) {
  //     int size = width/i;
  //     fill(255);
  //     rect(size*i, height/2, size, size);
  //   }
  //   //Arrays.asList(userList).toArray(new String[userList.length]);
    
  //   //for (S i : ) {
  //   //  int size = width/i;
  //   //  fill(255);
  //   //  rect(size*i, height/2, size, size);
  //   //  println(i);
  //   //}


  //   //println(m.arguments().length);
  //   //proin
  // }

  String address = m.addrPattern();

  if (address.equals("/clients")) {
    String value = m.get(0).stringValue();
    print("IPS: " + value);
  } else if(address.equals("/button")) {
    int value = m.get(0).intValue();
    println(m.typetag());
    println(value);
  }

  String firstValue = m.get(0).toString();
  println(firstValue);



  //println(m.typetag());
  //println(m.get(0));
}

// Parse clients into an array
// client[CLIENT INDEX]
