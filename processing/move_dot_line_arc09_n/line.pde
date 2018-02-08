class Line {
  int multiplier;
  Line() {
  }
  void call(float in0, float in1,float in4) {
    display(in0,in1,in4);
    multiplier = 3;
  }
  void display(float in0, float in1,float in4) {
    //_in0 = map
    noFill();
    stroke(255);
    in4=map(in4,-300,500,10,30);
    in4=constrain(in4,10,30);
    strokeWeight(in4/5);
    //stroke(100-in4*2,150+in4*5,150+in4*.8);
    line(width/2,400,width/2+multiplier*random(in1),400+multiplier*random(in0));
  }
}