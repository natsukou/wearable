import processing.serial.*;

Serial myPort;
Move move;
float in0, in1, in2, in3, in4, in5;
int[] sensors;

void setup() {
  size(600, 600); 
  frameRate(60);
  background(0);
  //println(Arduino.list());
  myPort = new Serial(this, Serial.list()[3], 9600);
  myPort.bufferUntil('\n');
  move = new Move(width/2, height/2, 5);
}
void draw() {
  //noStroke();
  //background(0);
  //println(frameCount);
  fill(0, 40);
  noStroke();
  rect(0, 0, width, height);
  move.call(in0, in2);
  //saveFrame("pic/line03_####.png");
  delay(300);
}
//void mousePressed(){
//  saveFrame("line_###.png");
//}
void serialEvent(Serial myPort) {
  try {
    String myString = myPort.readStringUntil('\n');
    myString = trim(myString);
    int sensors[] = int(split(myString, ","));
    if (sensors.length>1) {
      in0 = sensors[0];
      in1 = sensors[1];
      in2 = sensors[2];
      in3 = sensors[3];
      in4 = sensors[4];
      in5 = sensors[5];
    }
    //for(int i = 0;i<sensors.length;i++){
    //  text(sensors[i],20,20+20*i);
    //}
    print("sensor01_01;"+sensors[0]);
    print(" ");
    print("sensor01_02;"+sensors[1]);
    print(" ");
    print("sensor02_01;"+sensors[2]);
    print(" ");
    print("sensor02_02;"+sensors[3]);
    print(" ");
    print("speed_sensor01;"+sensors[4]);
    print(" ");
    println("spped_sensor02;"+sensors[5]);
    //println(myString);
  }
  catch(RuntimeException e) {
    println("Error parsing:");
    e.printStackTrace();
  }
}