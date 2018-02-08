import processing.serial.*;

Serial myPort;
Move move;
float in0, in1;
int[] sensors;

void setup() {
  size(600, 600); 
  frameRate(60);
  if (frameCount<=100) {
    background(0);
  }
  myPort = new Serial(this, Serial.list()[7], 9600);
  myPort.bufferUntil('\n');
  move = new Move(width/2, height/2, 5);
}
void draw() {
  if (frameCount<=50) {
    fill(0, 10);
    noStroke();
    rect(0, 0, width, height);
    move.callDotty(in0, in1,10);
    //saveFrame("pic/line03_####.png");
    delay(300);
  }
  if (frameCount>50&&frameCount<=200) {
    //fill(0);
    //noStroke();
    //rect(0,0,width,height);
    move.callDotty(in0,in1,2);
    delay(100);
  }
}
void serialEvent(Serial p) {
  try {
    String myString = myPort.readStringUntil('\n');
    myString = trim(myString);
    int sensors[] = int(split(myString, '\t'));
    if (sensors.length>1) {
      in0 = sensors[0];
      in1 = sensors[1];
    }
    print("sensor01;"+sensors[0]);
    print('\t');
    print("sensor02;"+sensors[1]);
    print('\t');
    println(frameCount);
  }
  catch(RuntimeException e) {
    println("Error parsing:");
    e.printStackTrace();
  }
}