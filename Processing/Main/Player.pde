class Player {
  float playerX, playerY, playerWidth, playerHeight; // Player position and scale vars.
  float velocityX, velocityY; // Velocity vars.
  float accelerationX, accelerationY; // Acceleration vars.
  String playerID; // Player Identifier variable

  //float ok = map(toInt(playerID,3),0,255,0,360);
  // Get a random color taking acoun the user ID
  final color pColor = color( random(0, 360), 100, random(75, 100));


  Player(float _x, float _y, float _w, float _h, String _id) {
    playerX = _x;
    playerY = _y;
    playerWidth = _w;
    playerHeight = _h;
    playerID = _id;
  }


  //    rectMode(CENTER);
  //fill(pColor);
  void display() {
    colorMode(HSB, 360, 100, 100);
    rectMode(CENTER);
    // PLAYER DIMENSION VARS
    float bodyHeight = playerHeight * 0.8;
    float headSize = playerHeight * 0.4;
    float playerHeight = bodyHeight+headSize;
    
    
    pushMatrix();
    translate(playerX, playerY-playerHeight/2);
    pushStyle(); // ENSURES PLAYER MODEL STYLE DOESNT GET CHANGED EXTERNALY
    stroke(0);
    strokeWeight(2);
    
    // PLAYER HEAD
    pushMatrix();
    translate(-headSize/2, -playerHeight/2);
    fill(pColor);
    ellipseMode(CORNER);
    circle(0, 0, headSize);
    popMatrix();

    // PLAYER BODY
    pushMatrix();
    pushStyle();
    rectMode(CORNER);
    translate(-playerWidth/2, -playerHeight/2+headSize);
    rect(0, 0, playerWidth, bodyHeight, 60);
    popStyle();
    popMatrix();


    //// BOX
    //noFill();
    //stroke(#00FF00);
    //rect(0, 0, playerWidth, playerHeight);
    popStyle();
    popMatrix();
  }

  void move(String _dir) {
    redraw();
    velocityX+=accelerationX;
    velocityY+=accelerationY;
    playerX+=velocityX;
    playerY+=velocityY;

    playerX = constrain(playerX, playerWidth/2, width-playerWidth/2); 
    //playerY = constrain(playerY, floorWallSplit, floorWallSplit-playerHeight/2);

    switch(_dir) {
    case "L": // LEFT
      velocityX = -4;
      break;
    case "U": // UP
      //velocityY -= 4;
      break;
    case "R": // RIGHT
      velocityX = 4;
      break;
    default:
      velocityX = 0;
      velocityY = 0;
    }
  }
}
