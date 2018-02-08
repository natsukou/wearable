//#define valueNum 3
const int echoPin1 = A0;
const int echoPin2 = A2;
const int trigPin1 = A1;
const int trigPin2 = A3;
void setup() {
  Serial.begin(9600);
}
void loop() {
  pinMode(echoPin1, INPUT);
  pinMode(trigPin1, OUTPUT);
  digitalWrite(trigPin1, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin1, LOW);
  int duration1 = pulseIn(echoPin1, HIGH);
  int distance1 = duration1 / 59;
  pinMode(echoPin2, INPUT);
  pinMode(trigPin2, OUTPUT);
  digitalWrite(trigPin2, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin2, LOW);
  int duration2 = pulseIn(echoPin2, HIGH);
  int distance2 = duration2 / 59;
  delay(100);
  
  digitalWrite(trigPin1,HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin1,LOW);
  int duration_1 = pulseIn(echoPin1,HIGH);
  int distance_1 = duration_1 / 59;
  digitalWrite(trigPin2, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin2, LOW);
  float duration_2 = pulseIn(echoPin2,HIGH);
  float distance_2 = duration_2 / 59;

  float speed1 = (distance_1-distance1)/.5;
  float speed2 = (distance_2-distance2)/.5;
  Serial.print(distance1);
  Serial.print(",");
  Serial.print(distance_1);
  Serial.print(",");
  Serial.print(distance2);
  Serial.print(",");
  Serial.print(distance_2);
  Serial.print(",");
  Serial.print(speed1);
  Serial.print(",");
  Serial.println(speed2);
//  delay(200);
}



