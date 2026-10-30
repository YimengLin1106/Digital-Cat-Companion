// Digital Cat Companion - interactive Processing prototype.
// The cat is drawn with shapes, and its mood changes with its needs.

DigitalCat cat;

UIButton feedButton;
UIButton playButton;


// ==========================================================
// SETUP
// ==========================================================

void setup() {

  // Set up the window and the two action buttons.
  size(1050, 700);

  smooth(8);

  cat = new DigitalCat(340, 365);

  feedButton = new UIButton(
    675, 490,
    135, 52,
    "FEED"
  );

  playButton = new UIButton(
    835, 490,
    135, 52,
    "PLAY"
  );
}


// ==========================================================
// MAIN LOOP
// ==========================================================

void draw() {

  // Update the cat, then draw the current frame.
  cat.update();

  drawBackground();

  drawHeader();

  cat.display();

  drawStatusPanel();

  drawFooter();
}


// ==========================================================
// BACKGROUND
// ==========================================================

void drawBackground() {
  background(247, 242, 232);
  noStroke();

  // Soft wall and floor colours keep the cat as the main focus.
  fill(232, 239, 226);
  rect(0, 120, 620, 445);
  fill(245, 230, 209);
  rect(0, 565, width, 135);
  fill(216, 198, 174);
  rect(0, 560, width, 5);

  // Window in the corner of the room.
  fill(205, 222, 216);
  rect(42, 155, 150, 170, 18);
  fill(248, 246, 226);
  rect(52, 165, 130, 150, 12);
  fill(191, 218, 211);
  rect(59, 172, 116, 136, 8);
  stroke(248, 246, 226);
  strokeWeight(7);
  line(117, 174, 117, 306);
  line(61, 240, 173, 240);
  noStroke();
  fill(255, 255, 255, 105);
  ellipse(84, 196, 24, 12);
  ellipse(147, 276, 30, 10);

  // Small plant decoration.
  fill(188, 133, 101);
  rect(70, 470, 58, 58, 9);
  fill(130, 170, 130);
  ellipse(83, 451, 28, 53);
  ellipse(106, 439, 31, 62);
  ellipse(122, 457, 26, 45);
  stroke(91, 139, 104);
  strokeWeight(3);
  line(99, 482, 106, 425);
  line(99, 482, 83, 440);
  line(99, 482, 122, 441);
  noStroke();

  // Rug under the cat.
  fill(226, 202, 174);
  ellipse(340, 535, 450, 80);
  fill(235, 216, 194);
  ellipse(340, 531, 410, 61);
  stroke(215, 190, 164, 150);
  strokeWeight(2);
  noFill();
  arc(340, 531, 350, 42, 0.1, PI - 0.1);
  noStroke();
}


// ==========================================================
// HEADER
// ==========================================================

void drawHeader() {

  textAlign(LEFT);

  fill(55);

  textSize(34);

  text(
    "Digital Cat Companion",
    65,
    65
  );

  textSize(15);
  fill(110);
  text("A little cat with its own moods", 67, 92);

  // A short accent line under the subtitle.
  stroke(220, 157, 105);
  strokeWeight(4);
  line(67, 108, 126, 108);
  noStroke();
}


// ==========================================================
// STATUS PANEL
// ==========================================================

void drawStatusPanel() {

  // Shadow
  noStroke();

  fill(0, 18);

  rect(
    647,
    137,
    350,
    435,
    25
  );

  // Main panel
  fill(255);

  rect(
    640,
    130,
    350,
    435,
    25
  );

  // Title
  textAlign(LEFT);

  fill(55);

  textSize(24);

  text(
    "Cat Status",
    675,
    172
  );

  textSize(13);

  fill(130);

  text(
    "Keep your companion happy and healthy.",
    675,
    194
  );


  // Mood
  fill(85);

  textSize(14);

  text(
    "Mood",
    675,
    227
  );

  drawMoodBadge(
    cat.mood,
    748,
    208
  );


  // Status bars
  drawStatusBar(
    "Happiness",
    cat.happiness,
    675,
    270,
    color(239, 159, 171)
  );

  drawStatusBar(
    "Hunger",
    cat.hunger,
    675,
    345,
    color(236, 183, 102)
  );

  drawStatusBar(
    "Energy",
    cat.energy,
    675,
    420,
    color(112, 180, 157)
  );


  // Buttons
  feedButton.display();
  playButton.display();

  fill(125);

  textSize(11);

  textAlign(CENTER);

  text(
    "Click the cat to pet it",
    815,
    558
  );
}


// ==========================================================
// MOOD BADGE
// ==========================================================

void drawMoodBadge(
  String mood,
  float x,
  float y
) {

  color badgeColor;

  if (mood.equals("Playful")) {

    badgeColor =
      color(239, 159, 171);

  } else if (mood.equals("Hungry")) {

    badgeColor =
      color(236, 183, 102);

  } else if (mood.equals("Tired")) {

    badgeColor =
      color(155, 166, 196);

  } else if (mood.equals("Sad")) {

    badgeColor =
      color(169, 183, 195);

  } else {

    badgeColor =
      color(112, 180, 157);
  }

  noStroke();

  fill(badgeColor);

  rect(
    x,
    y,
    105,
    27,
    14
  );

  fill(255);

  textAlign(CENTER, CENTER);

  textSize(12);

  text(
    mood,
    x + 52,
    y + 13
  );
}


// ==========================================================
// STATUS BAR
// ==========================================================

void drawStatusBar(
  String label,
  float value,
  float x,
  float y,
  color barColor
) {

  textAlign(LEFT);

  fill(70);

  textSize(15);

  text(
    label,
    x,
    y
  );

  textAlign(RIGHT);

  fill(110);

  text(
    int(value) + " / 100",
    x + 260,
    y
  );

  // Empty bar
  noStroke();

  fill(230);

  rect(
    x,
    y + 15,
    260,
    14,
    7
  );

  // Filled bar
  fill(barColor);

  rect(
    x,
    y + 15,
    260 * value / 100,
    14,
    7
  );
}


// ==========================================================
// FOOTER
// ==========================================================

void drawFooter() {

  fill(95);

  textAlign(CENTER);

  textSize(13);

  text(
    "CLICK CAT  •  PET        F  •  FEED        P  •  PLAY",
    width / 2,
    650
  );

  fill(145);

  textSize(11);

  text(
    "Feed when hunger rises, play when energy allows, and pet for happiness.",
    width / 2,
    675
  );
}


// ==========================================================
// MOUSE INPUT
// ==========================================================

void mouseReleased() {

  if (cat.contains(mouseX, mouseY)) {

    cat.pet();

  } else if (feedButton.isMouseOver()) {

    cat.feed();

  } else if (playButton.isMouseOver()) {

    cat.play();
  }
}


// ==========================================================
// KEYBOARD INPUT
// ==========================================================

void keyPressed() {

  // F = feed
  if (
    key == 'f' ||
    key == 'F'
  ) {

    cat.feed();
  }

  // P = play
  if (
    key == 'p' ||
    key == 'P'
  ) {

    cat.play();
  }

  // Space = pet
  if (key == ' ') {

    cat.pet();
  }
}


// ==========================================================
// DIGITAL CAT CLASS
// ==========================================================

class DigitalCat {

  // Keep the cat's position, needs and animation timers together.
  float x;
  float y;


  // ========================================================
  // INTERNAL STATES
  // ========================================================

  float happiness = 70;

  // Hunger ranges from 0 (full) to 100 (very hungry).
  // A larger value therefore means the cat needs food more urgently.
  float hunger = 20;

  float energy = 65;


  // ========================================================
  // MOOD
  // ========================================================

  String mood = "Content";

  String previousMood = "Content";


  // ========================================================
  // TIME
  // ========================================================

  int lastUpdateTime;


  // ========================================================
  // REACTION
  // ========================================================

  String reactionText = "";

  int reactionEndTime = 0;


  // ========================================================
  // INTERACTION ANIMATIONS
  // ========================================================

  int petAnimationEnd = 0;

  int playAnimationEnd = 0;

  int feedAnimationEnd = 0;


  // ========================================================
  // BLINKING
  // ========================================================

  boolean blinking = false;

  int nextBlinkTime;

  int blinkEndTime;


  // ========================================================
  // COLOURS
  // ========================================================

  color fur;

  color furLight;

  color furDark;

  color eyeColour;


  // ========================================================
  // CONSTRUCTOR
  // ========================================================

  DigitalCat(
    float startX,
    float startY
  ) {

    x = startX;

    y = startY;

    fur =
      color(222, 148, 83);

    furLight =
      color(246, 188, 132);

    furDark =
      color(190, 105, 57);

    eyeColour =
      color(82, 158, 112);

    lastUpdateTime =
      millis();

    nextBlinkTime =
      millis() + 2500;
  }


  // ========================================================
  // UPDATE
  // ========================================================

  void update() {

    // Use elapsed time so the needs change at a steady rate.
    int currentTime =
      millis();

    float deltaTime =
      (currentTime - lastUpdateTime)
      / 1000.0;

    lastUpdateTime =
      currentTime;

    deltaTime =
      min(
      deltaTime,
      0.1
      );


    // ------------------------------------------------------
    // NEED SYSTEM
    // ------------------------------------------------------

    // Hunger increases gradually as time passes.
    // Scale the change by elapsed time, not by frame count.
    hunger +=
      0.35 *
      deltaTime;


    // Energy comes back slowly while the cat rests.
    if (energy < 20) {

      energy +=
        1.2 *
        deltaTime;

    } else {

      energy +=
        0.12 *
        deltaTime;
    }


    // A very hungry cat slowly loses happiness.
    if (hunger > 70) {

      happiness -=
        0.20 *
        deltaTime;
    }


    // Being exhausted also lowers happiness.
    if (energy < 15) {

      happiness -=
        0.10 *
        deltaTime;
    }


    // Keep each need between 0 and 100.
    happiness =
      constrain(
      happiness,
      0,
      100
      );

    hunger =
      constrain(
      hunger,
      0,
      100
      );

    energy =
      constrain(
      energy,
      0,
      100
      );


    // Behaviour
    updateMood();

    updateBlink();
  }


  // ========================================================
  // BLINK SYSTEM
  // ========================================================

  void updateBlink() {

    // Tired cat keeps its eyes closed
    if (mood.equals("Tired")) {

      blinking = false;

      return;
    }


    if (
      !blinking &&
      millis() > nextBlinkTime
    ) {

      blinking = true;

      blinkEndTime =
        millis() + 150;
    }


    if (
      blinking &&
      millis() > blinkEndTime
    ) {

      blinking = false;

      nextBlinkTime =
        millis() +
        int(
        random(
        2200,
        4500
        )
        );
    }
  }


  // ========================================================
  // MOOD SYSTEM
  // ========================================================

  // Pick a mood from the current values.
  void updateMood() {

    // Save the old mood so a reaction only plays when the mood changes.
    previousMood =
      mood;


    if (energy < 20) {

      mood =
        "Tired";

    } else if (hunger > 70) {

      mood =
        "Hungry";

    } else if (happiness < 30) {

      mood =
        "Sad";

    } else if (
      happiness > 80 &&
      hunger < 45 &&
      energy > 45
    ) {

      mood =
        "Playful";

    } else {

      mood =
        "Content";
    }


    if (
      !mood.equals(previousMood)
    ) {

      reactToMoodChange();
    }
  }


  // ========================================================
  // AUTOMATIC REACTION
  // ========================================================

  void reactToMoodChange() {

    if (
      mood.equals("Hungry")
    ) {

      setReaction(
        "I'm hungry..."
      );

    } else if (
      mood.equals("Tired")
    ) {

      setReaction(
        "So sleepy..."
      );

    } else if (
      mood.equals("Sad")
    ) {

      setReaction(
        "Pet me?"
      );

    } else if (
      mood.equals("Playful")
    ) {

      setReaction(
        "Let's play!"
      );
    }
  }


  // ========================================================
  // DISPLAY
  // ========================================================

  void display() {
    pushMatrix();

    // The cat moves a little when playing and gently breathes at rest.
    float bounce = 0;
    if (millis() < playAnimationEnd) {
      bounce = -abs(sin(frameCount * 0.20)) * 12;
    }
    translate(x, y + bounce);
    float breathing = 1.0 + sin(frameCount * 0.04) * 0.006;
    scale(breathing);

    // Soft shadow keeps the cat grounded in the room.
    noStroke();
    fill(83, 67, 58, 28);
    ellipse(0, 184, 250, 28);

    drawTail();

    // Draw the ears first, so the bottom of each ear sits behind the head.
    stroke(184, 111, 66);
    strokeWeight(2.2);
    fill(fur);
    beginShape();
    vertex(-91, -125);
    bezierVertex(-108, -157, -98, -202, -70, -220);
    bezierVertex(-47, -207, -31, -179, -25, -145);
    bezierVertex(-44, -130, -68, -123, -91, -125);
    endShape(CLOSE);
    beginShape();
    vertex(91, -125);
    bezierVertex(108, -157, 98, -202, 70, -220);
    bezierVertex(47, -207, 31, -179, 25, -145);
    bezierVertex(44, -130, 68, -123, 91, -125);
    endShape(CLOSE);

    // Pink ear patches are smaller and softer than the outer ears.
    noStroke();
    fill(242, 151, 157);
    beginShape();
    vertex(-80, -151);
    bezierVertex(-83, -174, -76, -194, -68, -203);
    bezierVertex(-53, -187, -44, -166, -40, -151);
    bezierVertex(-54, -145, -68, -146, -80, -151);
    endShape(CLOSE);
    beginShape();
    vertex(80, -151);
    bezierVertex(83, -174, 76, -194, 68, -203);
    bezierVertex(53, -187, 44, -166, 40, -151);
    bezierVertex(54, -145, 68, -146, 80, -151);
    endShape(CLOSE);

    // A round body makes the character look more like a kitten.
    stroke(184, 111, 66);
    strokeWeight(2.2);
    fill(fur);
    ellipse(0, 72, 218, 232);
    noStroke();
    fill(furLight);
    ellipse(0, 91, 128, 143);
    fill(255, 226, 194, 115);
    ellipse(-16, 57, 62, 82);

    // A few short coat marks add detail without making the body too busy.
    stroke(furDark);
    strokeWeight(4.5);
    strokeCap(ROUND);
    noFill();
    arc(-76, 35, 35, 54, -HALF_PI, HALF_PI * 0.72);
    arc(-78, 65, 30, 48, -HALF_PI, HALF_PI * 0.65);
    arc(76, 35, 35, 54, PI * 0.22, PI * 1.48);
    arc(78, 65, 30, 48, PI * 0.35, PI * 1.5);
    noStroke();

    // Back paws peek out from under the body.
    fill(furDark);
    ellipse(-67, 158, 73, 43);
    ellipse(67, 158, 73, 43);
    fill(furLight);
    ellipse(-70, 158, 39, 23);
    ellipse(70, 158, 39, 23);

    // Big round head and cheeks are the main features of the kitten.
    stroke(184, 111, 66);
    strokeWeight(2.2);
    fill(fur);
    ellipse(0, -81, 232, 199);
    noStroke();

    // Small forehead marks and soft eyebrow patches.
    stroke(furDark);
    strokeWeight(5);
    strokeCap(ROUND);
    line(-27, -158, -19, -141);
    line(0, -163, 0, -142);
    line(27, -158, 19, -141);
    noStroke();
    fill(255, 211, 165, 105);
    ellipse(-53, -111, 25, 37);
    ellipse(53, -111, 25, 37);

    drawFace();

    // The collar and bell give the cat a small finishing detail.
    noStroke();
    fill(73, 157, 155);
    rect(-67, -7, 134, 13, 7);
    fill(255, 199, 71);
    ellipse(0, 10, 23, 23);
    fill(192, 126, 39);
    ellipse(0, 11, 4, 6);
    stroke(255, 232, 166);
    strokeWeight(1.5);
    noFill();
    arc(0, 10, 13, 13, 0.2, PI - 0.2);
    noStroke();

    // Short front legs and rounded paws.
    fill(fur);
    ellipse(-49, 111, 48, 88);
    ellipse(49, 111, 48, 88);
    fill(255, 197, 143);
    ellipse(-49, 151, 48, 29);
    ellipse(49, 151, 48, 29);
    stroke(196, 126, 78);
    strokeWeight(1.4);
    line(-57, 148, -57, 156);
    line(-49, 148, -49, 156);
    line(-41, 148, -41, 156);
    line(41, 148, 41, 156);
    line(49, 148, 49, 156);
    line(57, 148, 57, 156);

    popMatrix();

    // Draw the little interaction effects after the cat.
    displayReaction();
    displayPetEffect();
    displayFeedEffect();
    displayPlayEffect();
    if (mood.equals("Tired")) {
      displaySleepIndicator();
    }
  }

  // ========================================================
  // TAIL
  // ========================================================

  void drawTail() {
    float speed = 0.035;
    float amount = 6;

    if (mood.equals("Playful")) {
      speed = 0.13;
      amount = 17;
    } else if (mood.equals("Tired")) {
      speed = 0.018;
      amount = 2;
    } else if (mood.equals("Sad")) {
      speed = 0.02;
      amount = 3;
    }

    float movement = sin(frameCount * speed) * amount;
    noFill();
    stroke(furDark);
    strokeWeight(25);
    strokeCap(ROUND);
    bezier(88, 82, 151 + movement, 60, 178 + movement, -35, 127 + movement, -69);
  }

  // ========================================================
  // FACE
  // ========================================================

  void drawFace() {
    if (mood.equals("Tired") || blinking) {
      drawClosedEyes();
    } else if (mood.equals("Sad")) {
      drawSadEyes();
    } else {
      drawNormalEyes();
    }

    // Cream muzzle patches give the face a softer shape.
    noStroke();
    fill(255, 224, 202);
    ellipse(-25, -47, 61, 43);
    ellipse(25, -47, 61, 43);

    // A little blush appears after the cat has been petted.
    fill(245, 143, 157, millis() < petAnimationEnd ? 155 : 42);
    ellipse(-69, -49, 28, 16);
    ellipse(69, -49, 28, 16);

    // Tiny nose and mouth.
    fill(224, 125, 143);
    triangle(-8, -59, 8, -59, 0, -50);
    stroke(112, 76, 68);
    strokeWeight(2.5);
    line(0, -50, 0, -42);
    noFill();
    drawMouth();

    // Freckles and whiskers finish the face.
    noStroke();
    fill(158, 105, 81);
    ellipse(-35, -47, 2.8, 2.8);
    ellipse(-30, -42, 2.8, 2.8);
    ellipse(35, -47, 2.8, 2.8);
    ellipse(30, -42, 2.8, 2.8);

    stroke(139, 99, 80, 190);
    strokeWeight(1.4);
    line(-42, -53, -105, -65);
    line(-43, -47, -112, -47);
    line(-41, -40, -103, -27);
    line(42, -53, 105, -65);
    line(43, -47, 112, -47);
    line(41, -40, 103, -27);
  }

  // ========================================================
  // NORMAL EYES
  // ========================================================

  void drawNormalEyes() {
    // Larger eyes and two highlights make the expression easier to read.
    stroke(143, 91, 63);
    strokeWeight(1.5);
    fill(255, 250, 239);
    ellipse(-46, -91, 61, 56);
    ellipse(46, -91, 61, 56);

    noStroke();
    fill(eyeColour);
    ellipse(-46, -91, 38, 43);
    ellipse(46, -91, 38, 43);

    fill(37, 49, 43);
    ellipse(-46, -91, 17, 34);
    ellipse(46, -91, 17, 34);

    fill(255);
    ellipse(-39, -101, 10, 10);
    ellipse(53, -101, 10, 10);
    fill(255, 255, 255, 190);
    ellipse(-51, -84, 4, 4);
    ellipse(41, -84, 4, 4);
  }

  // ========================================================
  // CLOSED EYES
  // ========================================================

  void drawClosedEyes() {
    stroke(107, 73, 58);
    strokeWeight(3.5);
    strokeCap(ROUND);
    noFill();
    arc(-46, -88, 38, 19, 0, PI);
    arc(46, -88, 38, 19, 0, PI);
  }

  // ========================================================
  // SAD EYES
  // ========================================================

  void drawSadEyes() {
    drawNormalEyes();
    stroke(129, 80, 59);
    strokeWeight(3.5);
    strokeCap(ROUND);
    line(-69, -119, -42, -124);
    line(69, -119, 42, -124);
  }

  // ========================================================
  // MOUTH
  // ========================================================

  void drawMouth() {

    stroke(
      90,
      65,
      60
    );

    strokeWeight(2.5);

    noFill();


    if (
      mood.equals("Sad")
    ) {

      arc(
        0,
        -30,
        35,
        25,
        PI,
        TWO_PI
      );

    } else if (
      mood.equals("Hungry")
    ) {

      ellipse(
        0,
        -37,
        18,
        22
      );

    } else if (
      mood.equals("Playful")
    ) {

      arc(
        0,
        -48,
        55,
        45,
        0,
        PI
      );

    } else {

      arc(
        -10,
        -43,
        20,
        18,
        0,
        PI
      );

      arc(
        10,
        -43,
        20,
        18,
        0,
        PI
      );
    }
  }


  // ========================================================
  // PET EFFECT
  // ========================================================

  void displayPetEffect() {

    if (
      millis() <
      petAnimationEnd
    ) {

      float floatAmount =
        (petAnimationEnd - millis())
        * 0.025;


      fill(
        239,
        112,
        139
      );

      noStroke();

      textAlign(
        CENTER,
        CENTER
      );

      textSize(23);

      text(
        "♥",
        x - 85,
        y - 190 - floatAmount
      );

      textSize(17);

      text(
        "♥",
        x + 95,
        y - 170 - floatAmount
      );
    }
  }


  // ========================================================
  // FEED EFFECT
  // ========================================================

  void displayFeedEffect() {

    if (
      millis() <
      feedAnimationEnd
    ) {

      float fx =
        x + 105;

      float fy =
        y + 65;


      pushMatrix();

      translate(
        fx,
        fy
      );


      // Fish body
      noStroke();

      fill(
        239,
        170,
        89
      );

      ellipse(
        0,
        0,
        42,
        23
      );


      triangle(
        19,
        0,
        38,
        -14,
        38,
        14
      );


      fill(70);

      ellipse(
        -10,
        -3,
        4,
        4
      );


      popMatrix();
    }
  }


  // ========================================================
  // PLAY EFFECT
  // ========================================================

  void displayPlayEffect() {

    if (
      millis() <
      playAnimationEnd
    ) {

      float ballX =
        x - 155 +
        sin(
        frameCount * 0.13
        ) * 25;

      float ballY =
        y + 130 +
        abs(
        sin(
        frameCount * 0.16
        )
        ) * -35;


      noStroke();

      fill(
        102,
        156,
        194
      );

      ellipse(
        ballX,
        ballY,
        34,
        34
      );


      stroke(
        255,
        180
      );

      strokeWeight(2);

      noFill();

      arc(
        ballX,
        ballY,
        23,
        23,
        0,
        PI
      );
    }
  }


  // ========================================================
  // SLEEP EFFECT
  // ========================================================

  void displaySleepIndicator() {

    float floating =
      sin(
      frameCount * 0.05
      ) * 5;


    fill(
      100,
      110,
      150
    );

    textAlign(CENTER);

    textSize(18);

    text(
      "z",
      x + 115,
      y - 185 + floating
    );

    textSize(23);

    text(
      "Z",
      x + 140,
      y - 215 + floating
    );

    textSize(29);

    text(
      "Z",
      x + 170,
      y - 250 + floating
    );
  }


  // ========================================================
  // HIT DETECTION
  // ========================================================

  // Approximate hit detection uses two circles: one for the body and one
  // for the head. It keeps the interaction simple without image assets.
  boolean contains(
    float mx,
    float my
  ) {

    float bodyDistance =
      dist(
      mx,
      my,
      x,
      y + 45
      );

    float headDistance =
      dist(
      mx,
      my,
      x,
      y - 80
      );


    return
      bodyDistance < 135 ||
      headDistance < 115;
  }


  // ========================================================
  // PET
  // ========================================================

  void pet() {

    // Petting increases happiness and starts a temporary visual effect.
    happiness += 8;

    happiness =
      constrain(
      happiness,
      0,
      100
      );

    petAnimationEnd =
      millis() + 1000;


    if (
      mood.equals("Tired")
    ) {

      setReaction(
        "Purrr..."
      );

    } else {

      setReaction(
        "I like that!"
      );
    }
  }


  // ========================================================
  // FEED
  // ========================================================

  void feed() {

    // A lower hunger value means the cat is more full.

    // Do not feed repeatedly when the cat is already nearly full.
    if (
      hunger <= 5
    ) {

      setReaction(
        "I'm full!"
      );

      return;
    }


    // Feeding reduces hunger; the value is clamped to its valid range.
    hunger -= 35;

    hunger =
      constrain(
      hunger,
      0,
      100
      );

    feedAnimationEnd =
      millis() + 1200;

    setReaction(
      "Yum!"
    );
  }


  // ========================================================
  // PLAY
  // ========================================================

  void play() {

    // Playing changes the cat's needs as well as its animation.

    if (
      energy < 20
    ) {

      setReaction(
        "Too tired..."
      );

      return;
    }


    // Playing is refused when the cat is too hungry.
    if (
      hunger > 85
    ) {

      setReaction(
        "Feed me first!"
      );

      return;
    }


    happiness += 10;

    energy -= 12;

    // Active play consumes energy and makes the cat a little hungrier.
    hunger += 3;


    happiness =
      constrain(
      happiness,
      0,
      100
      );

    energy =
      constrain(
      energy,
      0,
      100
      );

    hunger =
      constrain(
      hunger,
      0,
      100
      );


    playAnimationEnd =
      millis() + 1500;

    setReaction(
      "Let's play!"
    );
  }


  // ========================================================
  // REACTION
  // ========================================================

  void setReaction(
    String message
  ) {

    reactionText =
      message;

    reactionEndTime =
      millis() + 1600;
  }


  // ========================================================
  // SPEECH BUBBLE
  // ========================================================

  void displayReaction() {

    // Keep the speech bubble to the right of the cat so it does not
    // overlap the title at the top of the application window.

    if (
      millis() <
      reactionEndTime
    ) {

      // Shadow
      noStroke();

      fill(
        0,
        20
      );

      rect(
        x + 115,
        y - 185,
        150,
        55,
        18
      );


      // Bubble
      fill(255);

      rect(
        x + 112,
        y - 188,
        150,
        55,
        18
      );


      triangle(
        x + 125,
        y - 133,
        x + 145,
        y - 133,
        x + 118,
        y - 120
      );


      // Text
      fill(70);

      textAlign(
        CENTER,
        CENTER
      );

      textSize(14);

      text(
        reactionText,
        x + 187,
        y - 160
      );
    }
  }
}


// ==========================================================
// UI BUTTON CLASS
// ==========================================================

class UIButton {

  // Both buttons use this class, so their size and behaviour stay consistent.
  float x;
  float y;

  float w;
  float h;

  String label;


  UIButton(
    float bx,
    float by,
    float bw,
    float bh,
    String buttonLabel
  ) {

    x = bx;

    y = by;

    w = bw;

    h = bh;

    label =
      buttonLabel;
  }


  // ========================================================
  // DISPLAY
  // ========================================================

  void display() {

    noStroke();


    // Shadow
    fill(
      0,
      15
    );

    rect(
      x + 2,
      y + 4,
      w,
      h,
      14
    );


    // Hover
    if (
      isMouseOver()
    ) {

      fill(
        91,
        150,
        138
      );

    } else {

      fill(
        112,
        170,
        158
      );
    }


    rect(
      x,
      y,
      w,
      h,
      14
    );


    fill(255);

    textAlign(
      CENTER,
      CENTER
    );

    textSize(14);

    text(
      label,
      x + w / 2,
      y + h / 2 - 1
    );
  }


  // ========================================================
  // HOVER CHECK
  // ========================================================

  boolean isMouseOver() {

    return
      mouseX >= x &&
      mouseX <= x + w &&
      mouseY >= y &&
      mouseY <= y + h;
  }
}
