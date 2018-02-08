import processing.serial.*;

Serial myPort;
Move move;
Line line;
int numSensors = 6;
int[] sensors;
float[] in;
int[] axis;
int[] offset;
int x;


void setup() {
  size(800, 800);
  background(0);
  frameRate(60);
  myPort = new Serial(this, Serial.list()[3], 9600);
  myPort.bufferUntil('\n');
  move = new Move(width/2, height/2);
  line = new Line();
  numSensors = 6;
  in = new float[numSensors];
  axis = new int[numSensors];
  offset = new int[numSensors];
  offset[0] = 1060;
  offset[1] = 1015;
  offset[2] = 2130;
  offset[3] = 2035;
  offset[4] = 1995;
  offset[5] = 2005;

  for (int i=0; i<6; i++) {
    axis[i] = (i+1) * 100;
  }
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
  line(x+1, 0, x+1, height);
  //色を指定
  stroke(0, 255, 0);
  //現在走査している場所を線で示す
  //line(x+5, 0, x+5, height);
  //なめらかにしていない値を描画
  //なめらかにした値を描画
  for (int i = 0; i<6; i++) {
    line(x, axis[i], x, axis[i]-(in[i]-offset[i])/50);
  }
  //X座標の更新
  x+= 2;
  //もし画面の端まできたら、最初から
  if (x > width) {
    x = 0;
  }
  saveFrame("k01_####.png");
}
//void mousePressed() {
//  saveFrame("k_####.png");
//}
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
    print("X;"+(sensors[0]-offset[0]));
    print('\t');
    print("Y;"+(sensors[1]-offset[1])); 
    print('\t');
    print("Z;"+(sensors[2]-offset[2])); 
    print('\t');
    print("roll;"+(sensors[3]-offset[3])); 
    print('\t');
    print("pitch;"+(sensors[4]-offset[4])); 
    print('\t');
    print("yaw;"+(sensors[5]-offset[5])); 
    println('\t');
  }
  catch(RuntimeException e) {
    println("Error parsing:");
    e.printStackTrace();
  }
}