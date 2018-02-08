import processing.serial.*;

Serial myPort0, myPort1;
Move[] move;
Line[] line;
int numSensors = 6;
int[][] sensors;
int x;
int[][] in;
int[][] axis;
int[][] offset = {{23, 1, -323, 3, 8, 6}, {-2, -4, -343, 14, -1, 2}};

void setup() {
  size(1000, 800); 
  background(0);
  frameRate(60);
  println(Serial.list());
  myPort0 = new Serial(this, Serial.list()[1], 9600);
  myPort1 = new Serial(this, Serial.list()[5], 9600);
  myPort0.bufferUntil('\n');
  myPort1.bufferUntil('\n');
  sensors = new int[2][numSensors];
  in = new int[2][numSensors];
  move = new Move[]{new Move(width/2, 400), new Move(width/2, 200)};
  line = new Line[]{new Line(), new Line()};
  axis = new int[2][numSensors];
  for (int i=0; i<2; i++) {
    for (int j=0; j<numSensors; j++) {
      axis[i][j] = (i*(numSensors + 1)+ (j+1) )* 50;
    }
  }
}
void draw() {
  //start of monitor
  stroke(0);
  line(x, 0, x, height);
  line(x+1, 0, x+1, height);
  stroke(0, 255, 0);
  for (int i = 0; i<2; i++) {
    for (int j = 0; j<numSensors; j++) {
      line(x, axis[i][j], x, axis[i][j]-in[i][j]/50);
    }
  }
  x+=2;
  if (x > width) {
    x = 0;
  }  
  //end of monitor
  //saveFrame("k08_####.png");
}
void serialEvent(Serial myPort) {
  String[] myString = new String[2]; //definition of series of string from arduino
  if (myPort == myPort0) {            //if port 0 is available
    try {                             //if string is available
      myString[0] = myPort0.readStringUntil('\n');
      myString[0] = trim(myString[0]);
      sensors[0] = int(split(myString[0], '\t'));
      if (sensors[0].length>1) {
        for (int i=0; i<numSensors; i++) {
          in[0][i] = sensors[0][i]+offset[0][i];
        }
      }
      print("X0;"+in[0][0]); 
      print(" ");
      print("Y0;"+in[0][1]); 
      print(" ");
      print("Z0;"+in[0][2]); 
      print(" ");
      print("roll0;"+in[0][3]); 
      print(" ");
      print("pitch0;"+in[0][4]); 
      print(" ");
      println("yaw0;"+in[0][5]);
    }
    catch(RuntimeException e) {    //if string is unavailable
      println("Error parsing:");
      e.printStackTrace();
    }
  } else if (myPort == myPort1) {    //if port 1 is available
    try {                            //if string is available
      myString[1] = myPort1.readStringUntil('\n');
      myString[1] = trim(myString[1]);
      sensors[1] = int(split(myString[1], '\t'));
      if (sensors[1].length>1) {
        for (int i=0; i<numSensors; i++) {
          in[1][i] = sensors[1][i]+offset[1][i];
        }
      }
      print("X1;"+in[1][0]); 
      print(" ");
      print("Y1;"+in[1][1]); 
      print(" ");
      print("Z1;"+in[1][2]); 
      print(" ");
      print("roll1;"+in[1][3]); 
      print(" ");
      print("pitch1;"+in[1][4]); 
      print(" ");
      println("yaw1;"+in[1][5]);
    }
    catch(RuntimeException e) {    //if string is not available
      println("Error parsing:");
      e.printStackTrace();
    }
  }
}