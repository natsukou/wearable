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
  void callDot(int in0, int in1,int in2, int maxSpeed, float r) {
    move();
    dotty(in0, in2, maxSpeed);
    displayDot(in1,r);
  }
  void callArc(int in0, int in1, int maxSpeed) {
    arcy(in0, in1, maxSpeed);
    displayArc();
  }
  void move() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  void dotty(int in0, int in1, int maxSpeed) {
    _in0 = map(in0, -distThreshold, distThreshold, -maxSpeed, maxSpeed);
    _in0 = constrain(_in0, -maxSpeed, maxSpeed);
    _in1 = map(in1, -distThreshold, distThreshold, -maxSpeed, maxSpeed);
    _in1 = constrain(_in1, -maxSpeed, maxSpeed);
    if (in0<=distThreshold&&in1<=distThreshold) { 
      PVector move = new PVector(_in0, _in1);
      if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
      if ((location.y<r)||(location.y>800-r)) velocity.add(move.x, -move.y);
      else velocity.add(move);
    }
    if (in0>distThreshold&&in1<=distThreshold) { 
      PVector move = new PVector(0, _in1);
      if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
      if ((location.y<r)||(location.y>800-r)) velocity.add(move.x, -move.y);
      else velocity.add(move);
    } 
    if (in0<=distThreshold&&in1>distThreshold) { 
      PVector move = new PVector(_in0, 0);
      if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
      if ((location.y<r)||(location.y>800-r)) velocity.add(move.x, -move.y);
      else velocity.add(move);
    } else { 
      PVector move = new PVector(0, 0);
      if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
      if ((location.y<r)||(location.y>800-r)) velocity.add(move.x, -move.y);
      else velocity.add(move);
    }
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
  void displayDot(int in0, float r) {
    fill(255);
    noStroke();
    _in0 = map(in0, -distThreshold, distThreshold, -maxWeight, maxWeight);    
    strokeWeight(_in0);
      ellipse(location.x, location.y, r, r);
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