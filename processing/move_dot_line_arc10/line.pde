class Line {
  int multiplier;
  float angle;
  Line() {
  }
  void call(float in0, float in1, float in4) {
    display(in0, in1, in4);
    multiplier = 3;
  }
  void display(float in3, float in5, float in1) {
    //_in0 = map
    in1 = map(in1,-300,100,100,500);
    in1 = constrain(in1,200,500);
    in5 = map(in5,-400,400,50,100);
    in5 = constrain(in5,50,100);
    in3 = map(in3,-600,600,180,360);
    in3 = constrain(in3,100,360);
    noFill();
    stroke(in3, 10, 200, in5);
    line(width/2, 400, width/2+cos(angle)*in1, 400+sin(angle)*in1);
    angle += .01;
    //delay(30);
  }
}