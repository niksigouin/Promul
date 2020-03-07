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
  
  void drawPlayer() {
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(playerX, playerY, playerW, playerH, 20);
  }
}
