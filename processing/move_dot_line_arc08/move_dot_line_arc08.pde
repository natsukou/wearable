import processing.serial.*;

Serial myPort;
Move move;
Line line;
int numSensors = 6;
int[] sensors;
int x;
int[] in;
int[] axis;
int[] offset;

void setup() {
  size(800, 1600); 
  background(0);
  frameRate(60);
  myPort = new Serial(this, Serial.list()[3], 9600);
  myPort.bufferUntil('\n');
  move = new Move(width/2, 400);
  line = new Line();
  numSensors = 6;
  in = new int[numSensors];
  axis = new int[numSensors];
  offset = new int[numSensors];
  offset[0] = -1130;
  offset[1] = -1000;
  offset[2] = -2740;
  offset[3] = -2000;
  offset[4] = -2000;
  offset[5] = -2000;
  for (int i=0; i<6; i++) {
    axis[i] = (i+1) * 100;
  }
}
void draw() {
  move.callDot(in[0], in[1],in[2], 20, 5); //in0,in1,in2,speed,r
  line.call(in[3], in[4]);  //in0,in1
  move.callArc(in[0], in[1], 10); //in0,in1,speed
  delay(300);
  //start of monitor
  stroke(0);
  line(x, 800, x, 1600);
  line(x+1, 800, x+1, 1600);
  stroke(0, 255, 0);
  for (int i = 0; i<numSensors; i++) {
    line(x, axis[i], x, axis[i]-(in[i])/50);
  }
  x+=2;
  if (x > width) {
    x = 0;
  }  
  //end of monitor
  
  //saveFrame("k02_####.png");
}
void serialEvent(Serial p) {
  try {
    String myString = myPort.readStringUntil('\n');
    myString = trim(myString);
    int sensors[] = int(split(myString, '\t'));
    if (sensors.length>1) {
      for (int i=0; i<6; i++) {
        in[i] = sensors[i];
      }
    }
    print("X;"+(sensors[0])); 
    print('\t');
    print("Y;"+(sensors[1])); 
    print('\t');
    print("Z;"+(sensors[2])); 
    print('\t');
    print("roll;"+(sensors[3])); 
    print('\t');
    print("pitch;"+(sensors[4])); 
    print('\t');
    println("yaw;"+(sensors[5]));
  }
  catch(RuntimeException e) {
    println("Error parsing:");
    e.printStackTrace();
  }
}