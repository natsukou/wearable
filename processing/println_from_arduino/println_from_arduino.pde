import processing.serial.*;

Serial myPort;
MoveX moveX;
float in0;
//int _in0;

void setup() {
  size(640, 480);
  frameRate(30);
  
  myPort = new Serial(this, Serial.list()[7], 9600);
  myPort.bufferUntil('\n');
  moveX = new MoveX(width/2,height/2,3);
}

void draw() {
  background(0);
  //noStroke();
  if(in0<=50){ 
    moveX.call(in0);
  } else { 
    moveX.call(50);
  }
}

void serialEvent(Serial p) {

  String inString0 = myPort.readStringUntil('\n');
  in0 = float(inString0);
  //_in0 = constrain(in0,0,100);
  print(inString0);
  //println(in0);
}