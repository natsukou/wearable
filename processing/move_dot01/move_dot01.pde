import processing.serial.*;

Serial myPort;
Move move;
float in0,in1;
String inString0,inString1;

void setup() {
  size(600, 600); 
  frameRate(60);
  //println(Arduino.list());
  myPort = new Serial(this, Serial.list()[7], 9600);
  myPort.bufferUntil('\n');
  move = new Move(width/2, height/2, 5);
}

void draw() {
  //noStroke();
  //background(0);
  //println(frameCount);
  fill(0, 10);
  rect(0,0,width,height);
  move.call(in0,in1);
  //saveFrame("pic/line03_####.png");
  delay(300);
  
}
//void mousePressed(){
//  saveFrame("line_###.png");
//}
void serialEvent(Serial myPort) {
  inString0 = myPort.readStringUntil('\t');
  in0 = float(inString0);
  inString1 = myPort.readStringUntil('\n');
  in1 = float(inString1);
  
  
  print(inString0);
  print('\t');
  println(inString1);
  //print('\t');
  //println(inString[2]);
}