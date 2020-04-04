// ANI LIBRARIE FOR ANIMATING SUBWAY MOUVEMENT
import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

// SUBWAY ANIMATOR
AniSequence seq;

// SUBWAY COLORS
color subBottomColor, subPanelColor, windowColor;

// SUBWAY PARAMETERS: POSITION ON X AXIS, TOTAL LENGTH OF TRAIN
float subPosX, subLength;

// BACKGROUND PARAMETERS
float floorWallSplit = 0.75;
ArrayList brickColors;

// NPC PARAMETERS
int numNPCS = 10; // AMOUNT OF NPCS IN SCENE
ArrayList<Player> NPCS = new ArrayList<Player>(); // INITIALISE NPC ARRAY

void setup() {
  size(1280, 720, P2D);
  brickColors = randomColor(10000);
  smooth();

  // SUBWAY ANIMATION VARIABLES
  subPosX = width;
  subLength = ((width * 0.6) * 8) + ((width * 0.2)*2);

  // ANI LIBRAIRIE INITIALISATION
  Ani.init(this);
  seq = new AniSequence(this);

  trainMove();

  // CONCRETE SLAB ON BOTTOM
  concrete();

  // NPCS
  for (int i=0; i < numNPCS; i++) {
    NPCS.add(new Player(random(50, width-50), height * floorWallSplit, 65, 130, ""));
  }
}

void draw() {
  //background(166);
  smooth();

  pushStyle();
  ceelingGradient(350);
  wall(0, 300, width, (height * floorWallSplit) - 300);
  banner(0, 300, width);
  entry((width/2), 300, 504.0, (height * floorWallSplit)-300); //554.9
  pushMatrix();
  translate(77/2, height * floorWallSplit);
  bench(0, 0, 75, 45);
  bench(75, 0, 75, 45);
  bench(75*2, 0, 75, 45);
  popMatrix();
  subFloor(0, height * floorWallSplit, width, (height-57) - height * floorWallSplit);
  metroMap(260, 337, 0.25);
  trainTimeDisplay(1032, 377, 121, 72);
  popStyle();

  // DISPLAY ALL NPCS
  showNPCS();

  // SUBWAY CAR [X POSITION, Y POSITION, NUMBER OF WAGONS]
  subway(subPosX, height * 0.75, 8);

  subBottomColor = 50;
  subPanelColor = #3f71e1;
  windowColor = color(128, 193, 255, 102);

  // SUBWAY ANIMATION REPEATER
  if (seq.isEnded()) {
    seq.start();
  }
}

void trainMove() {
  seq.beginSequence();
  seq.add(Ani.to(this, 10, 30, "subPosX", -subLength/2, Ani.QUINT_OUT));
  seq.add(Ani.to(this, 10, 5, "subPosX", -subLength*2, Ani.QUINT_IN));
  seq.endSequence();
  seq.start();
}

void showNPCS() {
  for (int i=0; i < NPCS.size(); i++) {
    pushStyle();
    NPCS.get(i).display();
    NPCS.get(i).animate();
    popStyle();
  }
}
