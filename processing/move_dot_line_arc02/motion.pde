class Move {
  PVector location;
  PVector position;
  PVector velocity;
  //PVector acceleration;
  float r;
  float _in0,_in1;
  int distThreshold=50;
  int maxSpeed;

  Move(float _x, float _y, float _r) {
    location = new PVector(_x, _y);
    //position = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    //acceleration = new PVector(0,0);
    r = _r;
  }
  void callDotty(float in0, float in1,float maxSpeed) {
    move();
    dotty(in0, in1,maxSpeed);
    //checkBoundaries(in0, in1);
    displayDotty();
  }
  void move() {
    //velocity.add(acceleration);
    location.add(velocity);
    velocity.mult(0);
  }
  void dotty(float in0, float in1,float maxSpeed) {
    _in0 = map(in0, 0, distThreshold, -maxSpeed, maxSpeed);
    _in1 = map(in1, 0, distThreshold, -maxSpeed, maxSpeed);
    if (in0<=50&&in1<=50) { 
      PVector move = new PVector(_in0, _in1);
      if((location.x<r)||(location.x>width-r)) velocity.add(-move.x,move.y);
      if((location.y<r)||(location.y>height-r)) velocity.add(move.x,-move.y);
      else velocity.add(move);
    }
    if (in0>50&&in1<=50) { 
      PVector move = new PVector(0, _in1);
      if((location.x<r)||(location.x>width-r)) velocity.add(-move.x,move.y);
      if((location.y<r)||(location.y>height-r)) velocity.add(move.x,-move.y);
      else velocity.add(move);
    } 
    if (in0<=50&&in1>50) { 
      PVector move = new PVector(_in0, 0);
      if((location.x<r)||(location.x>width-r)) velocity.add(-move.x,move.y);
      if((location.y<r)||(location.y>height-r)) velocity.add(move.x,-move.y);
      else velocity.add(move);
    } else { 
      PVector move = new PVector(0,0);
      if((location.x<r)||(location.x>width-r)) velocity.add(-move.x,move.y);
      if((location.y<r)||(location.y>height-r)) velocity.add(move.x,-move.y);
      else velocity.add(move);
    }
  }
  //void checkBoundaries(float in0, float in1) {
  //  if (((location.x<r)&&(in0<50))
  //    ||((location.x>width-r)&&(in1>=50))) velocity.x*=-1;
  //  if (((location.y<r)&&(in1<50))
  //    ||((location.y>width-r)&&(in1>=50))) velocity.y*=-1;
  //}
  void displayDotty() {
    fill(255);
    noStroke();
    ellipse(location.x, location.y, r, r);
  }
}