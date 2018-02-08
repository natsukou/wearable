import processing.serial.*;

Serial myPort;
Move move;
Line line;
float in0, in1, in2,in3,in4;
int[] sensors;

void setup() {
  size(800, 800); 
  frameRate(60);
  if (frameCount<=100) {
    background(0);
  }
  myPort = new Serial(this, Serial.list()[7], 9600);
  myPort.bufferUntil('\n');
  move = new Move(width/2, height/2);
  line = new Line();
}
void draw() {
  move.callDot(in0, in1, 5, 5);
  delay(200);
  line.call(in3, in4);
  delay(200);
  move.callArc(in0, in1, 10);
  delay(200);
}
void mousePressed() {
  saveFrame("k_####.png");
}
void serialEvent(Serial p) {
  try {
    String myString = myPort.readStringUntil('\n');
    myString = trim(myString);
    float sensors[] = float(split(myString, '\t'));
    if (sensors.length>1) {
      in0 = sensors[0];
      in1 = sensors[1];
      in2 = sensors[2];
      in3 = sensors[3];
      in4 = sensors[4];
    }
    print("X;"+sensors[0]);
    print('\t');
    print("Y;"+sensors[1]);
    print('\t');
    print("Z;"+sensors[2]);
    print('\t');
    print("xdeg"+sensors[3]);
    print('\t');
    print(in3);
    print('\t');
    println("ydeg"+sensors[4]);
  }
  catch(RuntimeException e) {
    println("Error parsing:");
    e.printStackTrace();
  }
}