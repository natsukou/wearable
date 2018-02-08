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
  int maxSpeed;
  float maxWeight = 2.7;
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
  void callArc(float in0, float in1,float in4, int maxSpeed) {
    //arcy(in0, in1, maxSpeed);
    displayArc(in1,in4);
  }
  void move() {
    //velocity.add(acceleration);
    location.add(velocity);
    velocity.mult(0);
  }
  void dotty(float in0, float in2, int maxSpeed) {
    in0 = map(in0, -100, 70, -maxSpeed, maxSpeed);
    in0 = constrain(in0, -maxSpeed, maxSpeed);
    if (in2<0) {
      in2 = map(in2, -300, 0, maxSpeed, -maxSpeed);
    } else {
      in2 = map(in2, 0, 500, maxSpeed, -maxSpeed);
    }
    in2 = constrain(in2, maxSpeed, -maxSpeed);
    //if (in0<=distThreshold&&in1<=distThreshold) { 
      PVector move = new PVector(in0, in2);
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
  //void arcy(int in0, int in1, int maxSpeed) {
  //  _in0 = map(in0, -distThreshold, distThreshold, -maxSpeed, maxSpeed);
  //  _in1 = map(in1, -distThreshold, distThreshold, -maxSpeed, maxSpeed);
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
  //}
  void displayDot(int in0, int in3, int in4, float r) {
    pushStyle();
    in3 = int(map(in3, -300, 600, 10, 255));
    in3 = constrain(in3, 10, 255);
    in4 = int(map(in4, -200, 300, 100, 200));
    in4 = constrain(in4, 100, 200);
    fill(300-in3*3, 150+in3*.6, 300-in3*.2, in4);
    noStroke();
    _in0 = map(_in0, -distThreshold, distThreshold, 1.2, maxWeight);
    _in0 = constrain(-in0, 1.2, maxWeight);
    ellipse(random(1, 1.17)*location.x-100, random(1, 1.17)*location.y-100, r*_in0, r*_in0);
    popStyle();
  }
  void displayArc(float in1,float in4) {
    noFill();
    stroke(255);
    in4 = map(in4, -600,600,.1,3);
    in4 = constrain(in4,1,3);
    strokeWeight(in4);
    in1 = map(in1, -300, 100, 10, 200);
    in1 = constrain(in1, 10, 200);
    //float eli= random(200, 700);
    //if (eli<rArc) {
    //  stroke(0);
    //  strokeWeight(10);
    //  rArc-=300;
    //  ellipse(location.x, location.y, eli, eli);
    //}
    arc(location.x+random(-10,10), location.y+random(-10,10), in1, in1, random(PI), random(PI*5/4)+random(PI));
  }
}