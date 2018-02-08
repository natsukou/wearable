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
  int maxSpeed;
  float maxWeight=2.7;
  Move(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0,0);
    
  }
  void callDot(int in0, int in1, int in2, int in3, int in4, int maxSpeed, float r) {
    move();
    dotty(in0, in2, maxSpeed);
    displayDot(in1, in3, in4, r);
  }
  void callArc(int in0, int in1,int in3, int in4, int maxSpeed) {
    arcy(in0, in1, maxSpeed);
    displayArc(in3,in4);
  }
  void move() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  void dotty(int in0, int in1, int maxSpeed) {
    _in0 = map(in0, -400, 400, -maxSpeed*1.2, maxSpeed);
    _in0 = constrain(_in0, -maxSpeed, maxSpeed);
    _in1 = map(in1, -400, 550, -maxSpeed, maxSpeed);
    _in1 = constrain(_in1, -maxSpeed, maxSpeed);
    //if (in0<=distThreshold&&in1<=600) { 
      PVector move = new PVector(_in0, _in1);
      if ((location.x<r)||(location.x>width-r)) acceleration.add(-move.x, move.y);
      if ((location.y<r)||(location.y>800-r)) acceleration.add(move.x, -move.y);
      else velocity.add(move);
    //}
    //if (in0>distThreshold&&in1<=600) { 
    //  PVector move = new PVector(0, _in1);
    //  if ((location.x<r)||(location.x>width-r)) acceleration.add(-move.x, move.y);
    //  if ((location.y<r)||(location.y>800-r)) acceleration.add(move.x, -move.y);
    //  else velocity.add(move);
    //} 
    //if (in0<=distThreshold&&in1>600) { 
    //  PVector move = new PVector(_in0, 0);
    //  if ((location.x<r)||(location.x>width-r)) acceleration.add(-move.x, move.y);
    //  if ((location.y<r)||(location.y>800-r)) acceleration.add(move.x, -move.y);
    //  else velocity.add(move);
    //} else { 
    //  PVector move = new PVector(0, 0);
    //  if ((location.x<r)||(location.x>width-r)) acceleration.add(-move.x, move.y);
    //  if ((location.y<r)||(location.y>800-r)) acceleration.add(move.x, -move.y);
    //  else velocity.add(move);
    //}
  }
  void arcy(int in0, int in1, int maxSpeed) {
    _in0 = map(in0, -100, 300, -maxSpeed, maxSpeed);
    _in1 = map(in1, -100, 300, -maxSpeed, maxSpeed);
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
    //in3=int(_in3);
    //in4=int(_in4);
    pushStyle();
    in3 = int(map(in3,-300,600,10,255));
    in3 = constrain(in3,10,255);
    in4 = int(map(in4,-200,300,65,100));
    in4 = constrain(in4,65,100);
    fill(300-in3*3,150+in3*.6,300-in3*.2,in4);
    //println(in3);
    //println();
    //println(in4);
    noStroke();
    _in0 = map(_in0, -distThreshold, distThreshold, 1.2, maxWeight);
    _in0 = constrain(-in0, 1, maxWeight);
    ellipse(random(1, 1.17)*location.x-200,random(1, 1.17)*location.y-200, r*_in0, r*_in0);
    popStyle();
  }
  void displayArc(int in3,int in4) {
    noFill();
    float eli=400;
    if (eli<rArc) {
      rArc-=300;
    }
    stroke(255);
    strokeWeight(1);
    tempX=location.x;
    tempY=location.y;
    //tempX=map(tempX, 0, 1200, 0, 800);
    //tempY=map(tempY, 0, 1600, 0, 1200);
    //tempX=constrain(tempX, 0, 800);
    //tempY=constrain(tempY, 0, 1200);
     pushStyle();
    in3 = int(map(in3,-300,600,10,255));
    in3 = constrain(in3,10,255);
    in4 = int(map(in4,-200,300,65,100));
    in4 = constrain(in4,65,100);
    fill(150-in3*3,20+in3*6,250-in3*2,45);
    strokeWeight(in4/30);
    arc(400, 400, rArc, rArc, start, start+PI);
    popStyle();
  }
}