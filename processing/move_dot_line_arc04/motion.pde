class Move {
  PVector location;
  PVector position;
  PVector velocity;
  //PVector acceleration;
  float r;
  float rArc;
  float start;
  float _in0, _in1;
  int distThreshold=80;
  float mid = distThreshold/2;
  int maxSpeed;

  Move(float _x, float _y) {
    location = new PVector(_x, _y);
    //position = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    //acceleration = new PVector(0,0);
  }
  void callDotty(float in0, float in1, float maxSpeed, float r) {
    move();
    dotty(in0, in1, maxSpeed);
    //checkBoundaries(in0, in1);
    displayDotty(r);
  }
  void callArc(float in0, float in1, float maxSpeed) {
    arcy(in0, in1, maxSpeed);
    displayArc();
    //if(700<rArc){
    //antiarcy(in0, in1, maxSpeed);
    //}
  }
  void move() {
    //velocity.add(acceleration);
    location.add(velocity);
    velocity.mult(0);
  }
  void dotty(float in0, float in1, float maxSpeed) {
    _in0 = map(in0, 0, distThreshold, -maxSpeed, maxSpeed);
    _in1 = map(in1, 0, distThreshold, -maxSpeed, maxSpeed);
    if (in0<=mid&&in1<=mid) { 
      PVector move = new PVector(_in0, _in1);
      if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
      if ((location.y<r)||(location.y>height-r)) velocity.add(move.x, -move.y);
      else velocity.add(move);
    }
    if (in0>mid&&in1<=mid) { 
      PVector move = new PVector(0, _in1);
      if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
      if ((location.y<r)||(location.y>height-r)) velocity.add(move.x, -move.y);
      else velocity.add(move);
    } 
    if (in0<=mid&&in1>mid) { 
      PVector move = new PVector(_in0, 0);
      if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
      if ((location.y<r)||(location.y>height-r)) velocity.add(move.x, -move.y);
      else velocity.add(move);
    } else { 
      PVector move = new PVector(0, 0);
      if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
      if ((location.y<r)||(location.y>height-r)) velocity.add(move.x, -move.y);
      else velocity.add(move);
    }
  }
  void arcy(float in0, float in1, float maxSpeed) {
    _in0 = map(in0, 0, distThreshold, -maxSpeed, maxSpeed);
    _in1 = map(in1, 0, distThreshold, -maxSpeed, maxSpeed);
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
  //void antiarcy(float in0, float in1, float maxSpeed) {
  //  pushStyle();
  //  strokeWeight(30);
  //  fill(0);
  //  _in0 = map(in0, 0, distThreshold, -maxSpeed, maxSpeed);
  //  _in1 = map(in1, 0, distThreshold, -maxSpeed, maxSpeed);
  //  if (in0<=distThreshold&&in1<distThreshold) {
  //    rArc += _in0*_in0;
  //    if (rArc<0) {
  //      rArc=0;
  //    }
  //    start += _in1;
  //  }
  //  if (in0>distThreshold&&in1<=distThreshold) {
  //    start += _in1;
  //  }
  //  if (in0<=distThreshold&&in1>distThreshold) {
  //    rArc += _in0*_in0;
  //    if (rArc<0) {
  //      rArc=0;
  //    }
  //  }
  //  arc(location.x, location.y, rArc, rArc, start, start+PI);
  //  popStyle();
  //  rArc-=500;
  //}
  //void checkBoundaries(float in0, float in1) {
  //  if (((location.x<r)&&(in0<50))
  //    ||((location.x>width-r)&&(in1>=50))) velocity.x*=-1;
  //  if (((location.y<r)&&(in1<50))
  //    ||((location.y>width-r)&&(in1>=50))) velocity.y*=-1;
  //}
  void displayDotty(float r) {
    fill(255);
    noStroke();
    ellipse(location.x, location.y, r, r);
  }
  void displayArc() {
    noFill();
    stroke(255);
    strokeWeight(1);
    float eli= random(200,700);
    if (eli<rArc) {
      stroke(0);
      strokeWeight(10);
      rArc-=300;
      ellipse(location.x, location.y, eli,eli);
    }
    arc(location.x, location.y, rArc, rArc, start, start+PI);
  }
}