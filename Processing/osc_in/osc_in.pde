import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(800, 600);
  oscP5 = new OscP5(this, 3334);
  
  myRemoteLocation = new NetAddress("127.0.0.1",3334);
  
}

void draw() {
  background(0);
}

void oscEvent(OscMessage theOscMessage) {
// Gets the first value of the osc message (Use of idex is for an array of values
// EX: 
// OSC MESSAGE OBJECT -> {IP ADDRESS}/XYPAD [12, 19]
// int x = theOscMessage.get(0).intValue();
// int y = theOscMessage.get(1).intValue();
  int firstValue = theOscMessage.get(0).intValue();
  println(firstValue);
}

// Parse clients into an array
// client[CLIENT INDEX]
