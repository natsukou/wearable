import processing.serial.*;

Serial myPort;
Move move;
Line line;
float in0, in1, in2, in3, in4, in5;
int[] sensors;
int x;
int xAxis,yAxis,zAxis,rollAxis,pitchAxis,yawAxis;


void setup() {
  size(800, 800); 
  frameRate(60);
  myPort = new Serial(this, Serial.list()[3], 9600);
  myPort.bufferUntil('\n');
  move = new Move(width/2, height/2);
  line = new Line();
  xAxis = 100;
  yAxis = 200;
  zAxis = 300;
  rollAxis = 400;
  pitchAxis = 500;
  yawAxis = 600;
}
void draw() {
  //move.callDot(in0, in1, 5, 5);
  //delay(200);
  //line.call(in3, in4);
  //delay(200);
  //move.callArc(in0, in1, 10);
  //delay(200);
  //白い線で前の値を消す
    stroke(0);
    line(x, 0, x, height);
    //色を指定
    stroke(63, 127, 255);
    //現在走査している場所を線で示す
    //line(x+5, 0, x+5, height);
    //なめらかにしていない値を描画
    //なめらかにした値を描画
    line(x, xAxis, x, xAxis-(in0-1060)/50);
    //X座標の更新
    x++;
    //もし画面の端まできたら、最初から
    if (x > width) {
      x = 0;
    }
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
      in5 = sensors[5];
    }
    
    print("X;"+sensors[0]); 
    print('\t');
    print("Y;"+sensors[1]); 
    print('\t');
    print("Z;"+sensors[2]); 
    print('\t');
    print("roll"+sensors[3]); 
    print('\t');
    print("pitch"+sensors[4]); 
    print('\t');
    print("yaw"+sensors[5]); 
    println('\t');
  }
  catch(RuntimeException e) {
    println("Error parsing:");
    e.printStackTrace();
  }
}