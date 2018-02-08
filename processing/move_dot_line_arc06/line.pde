class Line {
  int multiplier;
  Line() {
  }
  void call(float in0, float in1) {
    display(in0,in1);
    multiplier = 20;
  }
  void display(float in0, float in1) {
    noFill();
    stroke(255);
    strokeWeight(1);
    line(width/2+multiplier*random(in0),height/2+multiplier*random(in1)
          ,width/2+multiplier*random(in1),height/2+multiplier*random(in0));
  }
}