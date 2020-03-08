class Player {
  float pX, pY, pW, pH; // Player position and scale vars.
  float vX, vY; // Velocity vars.
  float aX, aY; // Acceleration vars.
  String pID;




  Player(float _x, float _y, float _w, float _h, String _id) {
    pX = _x;
    pY = _y;
    pW = _w;
    pH = _h;
    pID = _id;
  }
 
  void display() {
    colorMode(HSB, 255);
    rectMode(CENTER);
    pushMatrix();
    translate(pX, pY);
    fill(getColor(), getColor(), 255);
    rect(0, 0, pW, pH, 20);
    fill(0);
    textAlign(CENTER, BOTTOM);
    text(getColor(), 0, -pH/2);
    popMatrix();
  }

  void move(String _dir) {
    vX+=aX;
    vY+=aY;
    pX+=vX;
    pY+=vY;
    
    pX = constrain(pX, pW/2, width-pW/2); 
    pY = constrain(pY, pH/2, height-pH/2);
    
    switch(_dir) {
    case "L": // LEFT
      vX = -4;
      break;
    case "U": // UP
      //vY -= 4;
      break;
    case "R": // RIGHT
      vX = 4;
      break;
    default:
      vX = 0;
      vY = 0;
    }
  }

  Integer getColor() {
    return Integer.parseInt(pID.substring(10).trim());
  }
}
