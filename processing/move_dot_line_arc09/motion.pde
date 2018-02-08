class Move {
  PVector location;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float rArc;
  float start;
  float _in0, _in1;
  int distThreshold=200;
  int maxSpeed,maxWeight;
  Move(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0,0);
  }
  void callDot(int in0, int in1,int in2, int in3,int in4,int maxSpeed, float r) {
    move();
    dotty(in0, in2, maxSpeed);
    displayDot(in1, in3, in4, r);
  }
  void callArc(int in0, int in1, int maxSpeed) {
    arcy(in0, in1, maxSpeed);
    displayArc();
  }
  void move() {
    //velocity.add(acceleration);
    location.add(velocity);
    velocity.mult(0);
  }
  void dotty(int in0, int in1, int maxSpeed) {
    _in0 = map(in0, -distThreshold, distThreshold, -maxSpeed, maxSpeed);
    _in0 = constrain(_in0, -maxSpeed, maxSpeed);
    if(in1 > 0) _in1 = map(in1, 250, 450, -maxSpeed/2, maxSpeed/2);
    else _in1 = map(in1, -400, -100, -maxSpeed/2, maxSpeed/2);
    _in1 = constrain(_in1, -maxSpeed/2, maxSpeed/2);
    //if (in0<=distThreshold&&in1<=distThreshold) { 
      PVector move = new PVector(_in0, _in1);
      if (location.x<r) location.x += width-r;
      if (location.x>width-r) location.x -= width-r;
      if (location.y<r) location.y = 800-r;
      if (location.y>800-r) location.y = r;
      else velocity.add(move);
    //}
    //if (in0>distThreshold&&in1<=distThreshold) { 
    //  PVector move = new PVector(0, _in1);
    //  if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
    //  if ((location.y<r)||(location.y>800-r)) velocity.add(move.x, -move.y);
    //  else velocity.add(move);
    //} 
    //if (in0<=distThreshold&&in1>distThreshold) { 
    //  PVector move = new PVector(_in0, 0);
    //  if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
    //  if ((location.y<r)||(location.y>800-r)) velocity.add(move.x, -move.y);
    //  else velocity.add(move);
    //} else { 
    //  PVector move = new PVector(0, 0);
    //  if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
    //  if ((location.y<r)||(location.y>800-r)) velocity.add(move.x, -move.y);
    //  else velocity.add(move);
    //}
  }
  void arcy(int in0, int in1, int maxSpeed) {
    _in0 = map(in0, -distThreshold, distThreshold, -maxSpeed, maxSpeed);
    _in1 = map(in1, -distThreshold, distThreshold, -maxSpeed, maxSpeed);
    if (in0<=distThreshold&&in1<distThreshold) {
      rArc += _in0*_in0;
      if (rArc<0) {
        rArc=0;
      }
      start += _in1;
    }
    if (in0>distThreshold&&in1<=distThreshold) {
      start += _in1;
    }
    if (in0<=distThreshold&&in1>distThreshold) {
      rArc += _in0*_in0;
      if (rArc<0) {
        rArc=0;
      }
    }
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
  void displayArc() {
    noFill();
    stroke(255);
    strokeWeight(1);
    float eli= random(200, 700);
    if (eli<rArc) {
      stroke(0);
      strokeWeight(10);
      rArc-=300;
      ellipse(location.x, location.y, eli, eli);
    }
    arc(location.x, location.y, rArc, rArc, start, start+PI);
  }
}