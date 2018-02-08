
// Arduino code and library is available to download - link below the video.

/* Accelerometer connection pins (I2C) to Arduino are shown below:
 
 Arduino     Accelerometer ADXL345
 A5            SCL
 A4            SDA
 3.3V          CS
 3.3V          VCC
 GND           GND
 */

#include <Wire.h>
#include <ADXL345.h>


ADXL345 adxl; //variable adxl is an instance of the ADXL345 library

int x,y,z;  
int rawX, rawY, rawZ;
float X, Y, Z;
float rollrad, pitchrad;
float rolldeg, pitchdeg;

void setup(){
  Serial.begin(9600);
  adxl.powerOn();
}

void loop(){
  adxl.readAccel(&x, &y, &z); //read the accelerometer values and store them in variables  x,y,z
  // Output (x,y,z) on horizontal plane should be approximately (0,0,255) 
  // the following 3 lines is for an offset
  rawX=x+2;
  rawY=y+1;
  rawZ=z+16;

  X = rawX/256.00; // used for angle calculations
  Y = rawY/256.00; // used for angle calculations
  Z = rawZ/256.00; // used for angle calculations

  rollrad = atan(Y/sqrt(X*X+Z*Z));  // calculated angle in radians
  pitchrad = atan(X/sqrt(Y*Y+Z*Z)); // calculated angle in radians  

  rolldeg = 180*(atan(Y/sqrt(X*X+Z*Z)))/PI; // calculated angle in degrees
  pitchdeg = 180*(atan(X/sqrt(Y*Y+Z*Z)))/PI; // calculated angle in degrees
  // print out values:
  /*
  Serial.print("x: "); Serial.print(x);    // raw data without offset
   Serial.print(" y: "); Serial.print(y);     // raw data without offset
   Serial.print(" z: "); Serial.print(z);     // raw data without offset
   Serial.print(" rawX = "); Serial.print(rawX); // raw data with offset
   Serial.print(" rawY = "); Serial.print(rawY); // raw data with offset
   Serial.print(" rawZ = "); Serial.print(rawZ); // raw data with offset
   Serial.print(" X = "); Serial.print(X);    // raw data with offset and divided by 256
   Serial.print(" Y = "); Serial.print(Y);    // raw data with offset and divided by 256
   Serial.print(" Z = "); Serial.print(Z);    // raw data with offset and divided by 256
   */
  Serial.print(" X = "); 
  Serial.print(X); // raw data with offset
  Serial.print(" Y = "); 
  Serial.print(Y); // raw data with offset
  Serial.print(" Z = "); 
  Serial.print(Z); // raw data with offset
  Serial.print("\t Angle xaxis(deg) = "); 
  Serial.print(rolldeg);      // calculated angle in degrees
  Serial.print("\t Angle yaxis (deg) = "); 
  Serial.println(pitchdeg);  // calculated angle in degrees
  // Serial.print(" Roll(rad) = "); Serial.print(rollrad);   // calculated angle in radians
  // Serial.print(" Pitch(rad) = "); Serial.print(pitchrad); // calculated angle in radians
  delay(300);
}
// write to I2c
//void writeTo(int device, byte address,byte val) {
//  Wire.beginTransmission(device);  
//  Wire.write(address);         
//  Wire.write(val);                 
//  Wire.endTransmission();        
//}
//// read from I2c
//void readFrom(int device,byte address, int num, byte buff[]) {
//  Wire.beginTransmission(device); 
//  Wire.write(address);           
//  Wire.endTransmission();         
//  Wire.beginTransmission(device); 
//  Wire.requestFrom(device, num);   
//  int i = 0;
//  while(Wire.available())        
//  { 
//    buff[i] = Wire.read();   
//    i++;
//  }
//  Wire.endTransmission();         
//}
