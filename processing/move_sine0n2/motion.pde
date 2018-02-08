class Move {
  PVector location;
  PVector position;
  PVector velocity;
  //PVector acceleration;
  float r;
  float start;
  float _in0, _in1;
  int distThreshold=50;
  float maxSpeed=1;
  float px, py;
  int a=30;        //height
  int l=20;        //length
  float phi = 2*PI;  //max angle
  float f=PI/20;     //frequency


  Move(float _x, float _y, float _r) {
    location = new PVector(_x, _y);
    //position = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    //acceleration = new PVector(0,0);
    r = _r;
  }
  void call(float in0, float in1) {
    //move();
    sensor(in0, in1);
    //checkBoundaries(in0, in1);
    display();
  }
  //void move() {
  //  //velocity.add(acceleration);
  //  location.add(velocity);
  //  velocity.mult(0);
  //}
  void sensor(float in0, float in1) {
    _in0 = map(in0, 0, distThreshold, -maxSpeed, maxSpeed);
    _in1 = map(in1, 0, distThreshold, -maxSpeed, maxSpeed);
    if (in0<=50&&in1<=50) { 
      //PVector move = new PVector(_in0, _in1);
      r += _in0;
      start += _in1;
    }
    if (in0>50&&in1<=50) { 
      start += _in1;
    } 
    if (in0<=50&&in1>50) { 
      r += _in0;
    }
  }
  //void checkBoundaries(float in0, float in1) {
  //  if (((location.x<r)&&(in0<50))
  //    ||((location.x>width-r)&&(in1>=50))) velocity.x*=-1;
  //  if (((location.y<r)&&(in1<50))
  //    ||((location.y>width-r)&&(in1>=50))) velocity.y*=-1;
  //}
  void display() {
    noFill();
    stroke(255);
    strokeWeight(3);
    //ellipse(location.x, location.y, r, r);
    for (float i=0; i<phi; i+=f) {
      px=i*l;
      py=a*sin(i);
      ellipse(200+px+velocity.x, 200+py+velocity.y, r, r);
    }
  }
}