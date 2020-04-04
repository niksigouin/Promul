class Player {
  float playerX, playerY, playerWidth, playerHeight; // Player position and scale vars.

  // PLAYER EYES VARIABLE FOR ANIMATION
  float playerEyesX = 0;
  float playerEyesY = 0;

  // Get a random color taking acoun the user ID
  final color pColor = color( random(0, 360), 100, random(75, 100));


  Player(float _x, float _y, float _w, float _h) {
    playerX = _x;
    playerY = _y;
    playerWidth = _w;
    playerHeight = _h;
  }

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

    // PLAYER EYES
    float eyeSize = 10;
    float eyeSpacing = 13;

    pushMatrix();
    translate(((headSize/2)-eyeSize/2) + playerEyesX, (headSize/2-eyeSize/2) + playerEyesY);
    pushStyle();
    fill(255);
    circle(0 - eyeSpacing, 0, eyeSize);
    circle(0 + eyeSpacing, 0, eyeSize);
    popStyle();
    popMatrix();
    popMatrix();

    // PLAYER BODY
    pushMatrix();
    pushStyle();
    rectMode(CORNER);
    translate(-playerWidth/2, -playerHeight/2+headSize);
    rect(0, 0, playerWidth, bodyHeight, 60);
    popStyle();
    popMatrix();
    popStyle();
    popMatrix();
  }

  // ANIMATES THE EYES WITH A RANDOM NUMBER CORESPONDING TO EYE PLACEMENTS
  void animate() {
    int randomRate = (int) (random(3,5)*1000);
    if (millis()%randomRate > randomRate-100) {
      int randomDir = (int) random(50);

      if ((int) random(50) <= 10) {
        playerEyesX = 10;
        playerEyesY = 0;
      } else if (randomDir >= 11 && randomDir <= 20) {
        playerEyesX = -10;
        playerEyesY = 0;
      } else if (randomDir >= 21 && randomDir <= 30) {
        playerEyesY = 10;
        playerEyesX = 0;
      } else if (randomDir >= 31 && randomDir <= 40) {
        playerEyesY = -10;
        playerEyesX = 0;
      } else if (randomDir >= 41 && randomDir <= 50) {
        playerEyesX = 0;
        playerEyesY = 0;
      }
    }
  }
}
