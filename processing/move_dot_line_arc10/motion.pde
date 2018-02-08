class Move {
  PVector location;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float rArc;
  float start;
  float _in0, _in1, _in3, _in4, _in5;
  float tempX, tempY;
  int distThreshold=200;
  float maxSpeed;
  float maxWeight=2.7;
  float angle;

  Move(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  void callDot(int in0, int in1, int in2, int in3, int in4, float maxSpeed, float r) {
    move();
    dotty(in0, in2, maxSpeed);
    displayDot(in1, in3, in4, r);
  }
  void callArc(int in1, int in3, int in5) {
    displayArc(in1, in3, in5);
  }
  void move() {
    location.add(velocity);
    velocity.mult(0);
  }
  void dotty(float in0, float in2, float maxSpeed) {
    in0 = map(in0, -250, 100, -maxSpeed, maxSpeed);
    in0 = constrain(in0, -maxSpeed, maxSpeed);
    if (in2<0) {
      in2 = map(in2, -400, 0, -maxSpeed, maxSpeed);
    } else {
      in2 = map(in2, 0, 550, -maxSpeed, maxSpeed);
    }
    in2 = constrain(in2, -maxSpeed, maxSpeed);
    PVector move = new PVector(in0, in2);
    velocity.add(move);
    if (location.x<r) location.x = width - r;
    if (location.x>width-r) location.x = r;
    if (location.y<r) location.y = width - r;
    if (location.y>800 - r) location.y = r;
  }
  void displayDot(int in0, int in3, int in4, float r) {
    pushStyle();
    in3 = int(map(in3, -300, 600, 10, 255));
    in3 = constrain(in3, 10, 255);
    in4 = int(map(in4, -200, 300, 65, 100));
    in4 = constrain(in4, 65, 100);
    fill(300-in3*3, 150+in3*.6, 300-in3*.2, in4);
    noStroke();
    _in0 = map(_in0, -distThreshold, distThreshold, 1.2, maxWeight);
    _in0 = constrain(-in0, 1, maxWeight);
    ellipse(random(1, 1.17)*location.x-200, random(1, 1.17)*location.y-200, r*_in0, r*_in0);
    popStyle();
  }
  void displayArc(float in1, float in3, float in5) {
    in1 = map(in1, -300, 100, 100, 500);
    in1 = constrain(in1, 200, 500);
    in3 = map(in3, -600, 600, 180, 360);
    in3 = constrain(in3, 100, 360);
    in5 = map(in5, -400, 400, 100, 200);
    in5 = constrain(in5, 10, 255);
    rArc = in1;
    noFill();
    strokeWeight(1);
    stroke(200, in3, 100, in5);

    arc(400, 400, 2*rArc, 2*rArc, angle, angle + .01);
    angle += .01;
    //delay(30);
  }
}