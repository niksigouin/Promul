class Player {
  float playerX, playerY, playerW, playerH;
  String playerID;




  Player(float _x, float _y, float _w, float _h, String _id) {
    playerX = _x;
    playerY = _y;
    playerW = _w;
    playerH = _h;
    playerID = _id;
  }

  void display() {
    colorMode(HSB, 255);
    rectMode(CENTER);
    pushMatrix();
    translate(playerX, playerY);
    fill(getColor(), getColor(), 255);
    rect(0, 0, playerW, playerH, 20);
    fill(0);
    textAlign(CENTER, BOTTOM);
    text(getColor(), 0, -playerH/2);
    popMatrix();
  }

  Integer getColor() {
    return Integer.parseInt(playerID.substring(10).trim());
  }
}
