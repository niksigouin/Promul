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
    rectMode(CENTER);
    pushMatrix();
    translate(playerX, playerY);
    fill(#418541);
    rect(0, 0, playerW, playerH, 20);
    textAlign(CENTER, BOTTOM);
    text(playerID,0, -playerH/2);
    popMatrix();
  }
  
  String id() {
    return playerID;
  }
}
