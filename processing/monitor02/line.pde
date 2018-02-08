class Line {
  int multiplier;
  Line() {
  }
  void call(float in0, float in1,float in5) {
    display(in0,in1,in5);
    multiplier = 10;
  }
  void display(float in0, float in1,float in5) {
    //_in0 = map
    noFill();
    in5 = map(in5, -600,600,100,200);
    in5 = constrain(in5,100,200);
    stroke(255,in5);
    strokeWeight(1);
    in0 = map(in0, -250, 100, -200, 100);
    in0 = constrain(in0, -200, 100);
    in1 = map(in1, -300, 100, -100, 100);
    in1 = constrain(in1, -100, 100);
    line(width/2+multiplier*random(in0),400+multiplier*random(in1)
          ,width/2+multiplier*random(in1),400+multiplier*random(in0));
  }
}