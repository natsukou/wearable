class Move {
  PVector location;
  PVector position;
  PVector velocity;
  //PVector acceleration;
  float r;
  float _in0, _in1;
  float px, py;
  int distThreshold=50;
  int maxSpeed=50;
  float angle;

  Move(float _x, float _y, float _r) {
    location = new PVector(_x, _y);
    //position = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    //acceleration = new PVector(0,0);
    r = _r;
  }
  void call(float in0, float in1) {
    move();
    sensor(in0, in1);
    //checkBoundaries(in0, in1);
    display();
  }
  void move() {
    //velocity.add(acceleration);
    location.add(velocity);
    velocity.mult(0);
  }
  void sensor(float in0, float in1) {
    _in0 = map(in0, 0, distThreshold, 0, maxSpeed);
    _in1 = map(in1, 0, distThreshold, 0, maxSpeed);
    PVector sine = new PVector(_in0, _in1);
    if (in0<=50&&in1<=50) { 
      float angle = sine.heading();
      float dist = sqrt(pow(_in0, 2)+pow(_in1, 2));
      pushMatrix();
      rotate(-angle);
      for (int i=0; i<PI*2; i+=PI/10) {
        px=i*dist;
        py=10*sin(px);
      }
      velocity.add(px, py);
      //ellipse(location.x, location.y, r, r);

      popMatrix();
    }

    if (in0>50&&in1<=50) {
      float angle = sine.heading();
      float dist = sqrt(pow(_in1, 2));
      pushMatrix();
      rotate(-angle);
      for (int i=0; i<PI*2; i+=PI/10) {
        px=i*dist;
        py=10*sin(px);
      }
      velocity.add(px, py);
      ellipse(location.x, location.y, r, r);

      popMatrix();
    }
    if (in0<=50&&in1>50) {
      float angle = sine.heading();
      float dist = sqrt(pow(_in0, 2));
      pushMatrix();
      rotate(-angle);
      for (int i=0; i<PI*2; i+=PI/10) {
        px=i*dist;
        py=10*sin(px);
      }
      velocity.add(px, py);
      ellipse(location.x, location.y, r, r);

      popMatrix();
    }
    //if (in0<=50&&in1<=50) { 
    //  PVector move = new PVector(_in0, _in1);
    //  if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
    //  if ((location.y<r)||(location.y>height-r)) velocity.add(move.x, -move.y);
    //  else velocity.add(move);
    //}
    //if (in0>50&&in1<=50) { 
    //  PVector move = new PVector(0, _in1);
    //  if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
    //  if ((location.y<r)||(location.y>height-r)) velocity.add(move.x, -move.y);
    //  else velocity.add(move);
    //} 
    //if (in0<=50&&in1>50) { 
    //  PVector move = new PVector(_in0, 0);
    //  if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
    //  if ((location.y<r)||(location.y>height-r)) velocity.add(move.x, -move.y);
    //  else velocity.add(move);
    //} else { 
    //  PVector move = new PVector(0, 0);
    //  if ((location.x<r)||(location.x>width-r)) velocity.add(-move.x, move.y);
    //  if ((location.y<r)||(location.y>height-r)) velocity.add(move.x, -move.y);
    //  else velocity.add(move);
    //}
  }
  //void checkBoundaries(float in0, float in1) {
  //  if (((location.x<r)&&(in0<50))
  //    ||((location.x>width-r)&&(in1>=50))) velocity.x*=-1;
  //  if (((location.y<r)&&(in1<50))
  //    ||((location.y>width-r)&&(in1>=50))) velocity.y*=-1;
  //}
  void display() {
    //fill(255);
    stroke(255);
    fill(255);
    for(int i=0;i<10*PI;i++){
    ellipse(location.x+i*5, location.y+sin(i)*5, r, r);
    text(location.x, location.x, location.y);
    //point(location.x,location.y);
    }
  }
}